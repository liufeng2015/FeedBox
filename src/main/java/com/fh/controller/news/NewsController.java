package com.fh.controller.news;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.communication.CommunicationService;
import com.fh.service.enterprise.EnterpriseService;
import com.fh.service.news.NewsPushService;
import com.fh.service.news.NewsService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
/** 
 * 类名称：DictionariesController
 * 创建人：FH
 * 创建时间：2014年9月2日
 * @version
 */
@Controller
@RequestMapping(value="/news")
public class NewsController extends BaseController {


	@Resource(name="newsService")
	private NewsService newsService;
	

	@Resource(name="newsPushService")
	private NewsPushService newsPushService;
	/**
	 * 列表
	 */
	@RequestMapping
	public ModelAndView list(Page page)throws Exception{

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);				
		List<PageData> varList = newsService.dictlistPage(page);
		mv.setViewName("news/list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{

		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		
		String N_ID = pd.getString("N_ID");
		
		if(null != N_ID && !"".equals(N_ID)){

			pd.put("UpdateTime", DateUtil.getTime());
			pd.put("UpdateUser",  user.getUSERNAME());
			newsService.edit(pd);
		}else{

			pd.put("N_ID", this.get32UUID());	//ID
			pd.put("DR",  0);
			pd.put("CreateTime", DateUtil.getTime());
			pd.put("CreateUser",  user.getUSERNAME());
			newsService.save(pd);
		}
	

		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
		
	}

	
	
	

	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			mv.setViewName("news/edit");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	
	
	/**
	 * 去编辑页面
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit( String ROLE_ID )throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = newsService.findById(pd);
		mv.setViewName("news/edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	/**
	 * 删除用户
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String errInfo = "";
		try{
			pd = this.getPageData();
			pd.put("DeleteTime", DateUtil.getTime());
			pd.put("DeleteUser",  user.getUSERNAME());
			newsService.delete(pd);
			errInfo = "success";
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
		
	}
	

	@RequestMapping(value="/push")
	@ResponseBody
	public Object push(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String errInfo = "";
		try{
			pd = this.getPageData();
			pd.put("PushTime", DateUtil.getTime());
			pd.put("PushUser",  user.getUSERNAME());
			newsService.push(pd);
			newsPushService.push(pd);
			errInfo = "success";
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
		
	}

}
