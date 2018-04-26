package com.fh.controller.communication;

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
@RequestMapping(value="/communication")
public class CommunicationController extends BaseController {


	@Resource(name="communicationService")
	private CommunicationService communicationService;
	

	@Resource(name="enterpriseService")
	private EnterpriseService enterpriseService;
	
	/**
	 * 列表
	 */
	@RequestMapping
	public ModelAndView list(Page page)throws Exception{

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);				
		List<PageData> varList = communicationService.dictlistPage(page);
		mv.setViewName("communication/list");
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
		PageData pdp = new PageData();
		pdp = this.getPageData();

		

		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		
		String C_ID = pd.getString("C_ID");

		
		pdp.put("C_ID", C_ID);
		pd.put("E_ID",  pd.getString("E_ID"));
		pd.put("Name",  pd.getString("Name"));
		pd.put("Phone",  pd.getString("Phone"));
		pd.put("EMail",  pd.getString("EMail"));
		
		if(null != C_ID && !"".equals(C_ID)){

			pd.put("UpdateTime", DateUtil.getTime());
			pd.put("UpdateUser",  user.getUSERNAME());
			communicationService.edit(pd);
		}else{

			pd.put("C_ID", this.get32UUID());	//ID
			pd.put("DR",  0);
			pd.put("CreateTime", DateUtil.getTime());
			pd.put("CreateUser",  user.getUSERNAME());
			communicationService.save(pd);
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
			mv.setViewName("communication/edit");
			
			List<PageData> enterpriseList = enterpriseService.getIdAndName();
			mv.addObject("enterpriseList", enterpriseList);
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
		pd = communicationService.findById(pd);
		mv.setViewName("communication/edit");
		

		List<PageData> enterpriseList = enterpriseService.getIdAndName();
		mv.addObject("enterpriseList", enterpriseList);
		
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
			communicationService.delete(pd);
			errInfo = "success";
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	

}
