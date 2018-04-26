package com.fh.controller.notice;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;

import com.fh.service.notice.NoticeService;
import com.fh.service.system.dictionaries.DictionariesService;
import com.fh.service.system.menu.MenuService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DataConstants;
import com.fh.util.DateUtil;
import com.fh.util.DelAllFile;
import com.fh.util.FileUpload;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.StringUtil;
/** 
 * 类名称：DictionariesController
 * 创建人：FH
 * 创建时间：2014年9月2日
 * @version
 */
@Controller
@RequestMapping(value="/notice")
public class NoticeController extends BaseController {
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="title",required=false) String title,
			@RequestParam(value="content",required=false) String content,
			@RequestParam(value="isInvalid",required=false) String isInvalid,
			@RequestParam(value="id",required=false) String id
			) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String  ffile = DateUtil.getDays(), fileName = "",extName="";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE + ffile;		//文件上传路径
			extName=FileUpload.fileUp(file, filePath, this.get32UUID());	
			fileName =file.getOriginalFilename();		//执行上传
			pd.put("filename",  fileName);
			pd.put("filenamepath",   ffile + "/" + extName);
		}else{
			System.out.println("上传失败");
		}

		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if(null == id && "".equals(id)){
		pd.put("title", title);
		pd.put("content", content);
        pd.put("dr", 0);
        pd.put("isInvalid", Integer.parseInt(isInvalid));
        pd.put("createDate", DateUtil.getTime());
        
        if(!"1".equals(isInvalid)){
 	       pd.put("authorId", user.getUSER_ID());
 	       pd.put("author", user.getUSERNAME());
           pd.put("publishTime", DateUtil.getTime());
           pd.put("isInvalid", Integer.parseInt(isInvalid));
 		}else{
 			pd.put("isInvalid", 1);
 		}
        noticeService.save(pd);
        }else{
        	pd.put("id", id);
        	pd.put("title", title);
    		pd.put("content", content);
        	pd.put("updateDate", DateUtil.getTime());
        	pd.put("dr", 0);
        	if(!"1".equals(isInvalid)){
     	       pd.put("authorId", user.getUSER_ID());
     	       pd.put("author", user.getUSERNAME());
            	   pd.put("publishTime", DateUtil.getTime());
                pd.put("isInvalid", Integer.parseInt(isInvalid));
     		}else{
     			pd.put("isInvalid", 1);
     		}
            noticeService.edit(pd);
        }
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
		
	}

	
	/**
	 * 列表
	 */

	@RequestMapping(value="/noticeList")
	public ModelAndView list(Page page)throws Exception{
		
		/*Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);*/
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/*pd.put("deptId", user.getDepId());*/
		page.setPd(pd);				
		List<PageData> varList = noticeService.dictlistPage(page);
		mv.setViewName("notice/list");
		mv.addObject("varList", varList);
		mv.addObject("varsList", varList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 列表
	 */

	@RequestMapping(value="/noticeListTop")
	public ModelAndView noticeListTop(Page page)throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("isInvalid", 2);
		page.setShowCount(5);
		page.setPd(pd);				
		List<PageData> varList = noticeService.dictlistPage(page);
		mv.setViewName("notice/top");
		mv.addObject("varList", varList);
		mv.addObject("varsList", varList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 去编辑页面
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd = noticeService.findById(pd);
			mv.setViewName("notice/edit");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	/**
	 * 去新增
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			mv.setViewName("notice/add");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	/**
	 * 去查看
	 */
	@RequestMapping(value="/toView")
	public ModelAndView toView(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd = noticeService.findById(pd);
			mv.setViewName("notice/view");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		String errInfo = "";
		try{
			pd = this.getPageData();
			pd.put("dr", 1);
			pd.put("deleteDate", DateUtil.getTime());
			noticeService.delete(pd);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
		
	}	
	   //删除文件
		@RequestMapping(value="/delFile")
		public void delFile(PrintWriter out) {
			logBefore(logger, "删除文件");
			try{
				PageData pd = new PageData();
				pd = this.getPageData();
				String filenamepath = pd.getString("filenamepath");													 	
				if(filenamepath != null){	 
					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHFILE + pd.getString("filenamepath")); 	
					noticeService.delFile(pd);																
				}	
				out.write("success");
				out.close();
			}catch(Exception e){
				logger.error(e.toString(), e);
			}
		}
		
}
