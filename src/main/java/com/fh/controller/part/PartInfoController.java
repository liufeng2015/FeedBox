package com.fh.controller.part;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.boxPartRel.BoxPartRelService;
import com.fh.service.part.PartInfoService;
import com.fh.service.system.user.UserService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 类名称：PartInfoController 创建人：DJK 创建时间：2017年10月10日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/partInfo")
public class PartInfoController extends BaseController {

	@Resource(name = "partInfoService")
	private PartInfoService partInfoService;
	
	@Resource(name = "boxPartRelService")
	private BoxPartRelService boxPartRelService;
	
	@Resource(name="userService")
	private UserService userService;
	/**
	 * 保存
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save(PrintWriter out) throws Exception {

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdp = new PageData();
		pdp = this.getPageData();

		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);

		String AP_ID = pd.getString("AP_ID");

		pdp.put("ID", AP_ID);
		//校验公司名是否重复
        
		if (null != AP_ID && !"".equals(AP_ID)) {
			pd.put("ID", AP_ID);
			pd.put("UpdateTime", DateUtil.getTime());
			pd.put("UpdateUser", user.getUSERNAME());
			pd.put("CreateTime", DateUtil.getTime());
			pd.put("CreateUser", user.getUSERNAME());
			pd.put("LOGID", this.get32UUID()); // ID
			pd.put("INFO", "编辑零件：‘"+pd.getString("PartName")+"’的内容");
			partInfoService.edit(pd);
		} else {
			pd.put("ID", this.get32UUID()); // ID
			pd.put("DR", 0);
			pd.put("CreateTime", DateUtil.getTime());
			pd.put("CreateUser", user.getUSERNAME());
			pd.put("LOGID", this.get32UUID()); // ID
			pd.put("INFO", "新增零件名："+pd.getString("PartName"));
			pd.put("TrayId", pd.getString("trayId"));
			partInfoService.save(pd);
			 
					
			
			pd.put("NAME", pd.get("PartName").toString());
			pd.put("NUMBER", pd.get("PartName").toString());
			pd.put("USERNAME", pd.get("PartName").toString());
			pd.put("PASSWORD", "e7998e285ec909bfb90b47aee4540a3d27bfb6e3");
			
			//pd.put("PHONE", pd.get("ContactsTel").toString());
			pd.put("EMAIL", "");
			pd.put("BZ", "");
			pd.put("ROLE_ID", "3cf6bfe346574aae914867d5815c3439");
			pd.put("USER_ID", this.get32UUID());	//ID
			pd.put("RIGHTS", "");					//权限
			pd.put("LAST_LOGIN", "");				//最后登录时间
			pd.put("IP", "");						//IP
			pd.put("STATUS", "0");					//状态
			pd.put("SKIN", "default");				//默认皮肤
			
			pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), "123").toString());
			String menuUrl = "user/listUsers.do";
			if(Jurisdiction.buttonJurisdiction(menuUrl, "add")){userService.saveU(pd);} //判断新增权限
		}

		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;

	}

	/**
	 * 列表
	 */
	@RequestMapping
	public ModelAndView list(Page page) throws Exception {

		//String a = Array.toString(companyNature);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String AP_ID = pd.getString("AP_ID");

		// page.setShowCount(5); //设置每页显示条数
		page.setPd(pd);
		List<PageData> varList = partInfoService.dictlistPage(page);

		mv.setViewName("part/info/part_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);

		return mv;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/toAdd")
	public ModelAndView toAdd(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			mv.setViewName("part/info/part_edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		return mv;
	}

	/**
	 * 去编辑页面
	 */
	@RequestMapping(value = "/toEdit")
	public ModelAndView toEdit(String ROLE_ID) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = partInfoService.findById(pd);
		mv.setViewName("part/info/part_edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 判断编码是否存在
	 */
	@RequestMapping(value = "/has")
	public void has(PrintWriter out) {
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			if (partInfoService.findRepeatCount(pd) != null) {
				out.write("error");
			} else {
				out.write("success");
			}
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

	}

	/**
	 * 删除用户
	 */
	@RequestMapping(value = "/del")
	@ResponseBody
	public Object del() {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();

		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);

		String errInfo = "";
		try {
			pd = this.getPageData();
			pd.put("DeleteTime", DateUtil.getTime());
			pd.put("DeleteUser", user.getUSERNAME());			
			
			//校验是否删除数据中已经有被选中的物料箱
			Page pageDate = new Page();
			pageDate.setPd(pd);
			
			//1、删除零件表
			partInfoService.delete(pd);
			
			//2、根据零件ID查询零部件与箱子关系表中未删除的箱子数据
			pd.put("PartId", pd.getString("ID"));
			List<PageData> dataList = boxPartRelService.listAll(pd);
			String id = "";
			for(PageData data :dataList){
				id = data.getString("ID");
			}
			if(id != null && !"".equals(id)){
				pd.put("ID", id);
				//3、删除零部件与箱子关系数据
				boxPartRelService.delete(pd);
			}
			errInfo = "success";
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

}
