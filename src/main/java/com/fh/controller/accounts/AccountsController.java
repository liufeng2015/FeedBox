package com.fh.controller.accounts;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import com.fh.service.accounts.AccountsService;
import com.fh.service.system.dictionaries.DictionariesService;
import com.fh.service.system.menu.MenuService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DataConstants;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
/** 
 * 类名称：DictionariesController
 * 创建人：FH
 * 创建时间：2014年9月2日
 * @version
 */
@Controller
@RequestMapping(value="/accountsController")
public class AccountsController extends BaseController {


	@Resource(name="AccountsService")
	private AccountsService AccountsService;
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{

		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("acsId", pd.getString("acsId"));
		pd.put("acsName", pd.getString("acsName"));
		pd.put("App_Id", pd.getString("App_Id"));
		pd.put("App_secret", pd.getString("App_secret"));
		pd.put("status", pd.getString("status"));
		pd.put("createDate", DateUtil.getTime());
		pd.put("updateDate", DateUtil.getTime());
		pd.put("organizer", pd.getString("organizer"));
		pd.put("dr", 0);
	    if(pd.getString("acsId")==null)
	    	AccountsService.save(pd);
	  else
		    AccountsService.edit(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
		
	}

	
	/**
	 * 列表
	 */
	@RequestMapping(value="/accountsList")
	public ModelAndView repairList(Page page)throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> varList = AccountsService.dictlistPage(page);
		
		mv.setViewName("system/accounts/acs_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		
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
			mv.setViewName("system/accounts/acs_Add");
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
		pd = AccountsService.findById(pd);
		
		
		mv.setViewName("system/accounts/acs_edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/remove")
	@ResponseBody
	public Object del(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		
		pd.put("deleteUser", user.getUSERNAME());
		pd.put("deleteDate", DateUtil.getTime());
		try {
			AccountsService.delete(pd);
		} catch (Exception e) {e.printStackTrace();}
			
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}
