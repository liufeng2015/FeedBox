package com.fh.controller.trayBoxRel;

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
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayBoxRel.TrayBoxRelService;
import com.fh.service.trayPartRel.TrayPartRelService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;

/**
 * 类名称：TrayBoxRelController 创建人：DJK 创建时间：2017年10月11日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/trayBoxRelInfo")
public class TrayBoxRelController extends BaseController {
	
	@Resource(name = "trayBoxRelService")
	private TrayBoxRelService trayBoxRelService;
	
	@Resource(name = "trayInfoService")
	private TrayInfoService trayInfoService;
	
	@Resource(name = "trayPartRelService")
	private TrayPartRelService trayPartRelService;
//	/**
//	 * 列表
//	 */
//	@RequestMapping
//	public ModelAndView list(Page page) throws Exception {
//
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		
//		page.setPd(pd);
//		List<PageData> varList = null;
//		// 选择状态
//		String CHOOSE_TYPE = pd.getString("CHOOSE_TYPE");
//		pd.put("CHOOSE_TYPE", CHOOSE_TYPE);
//		// 该项目已经选中的物料箱名称
//		if (CHOOSE_TYPE != null && "1".equals(CHOOSE_TYPE)) {
//			varList = trayBoxRelService.dictChooselistPage(page);
//		}
//		// 该项目未被选中的物料箱名称
//		if (CHOOSE_TYPE != null && "2".equals(CHOOSE_TYPE)) {
//			varList = trayBoxRelService.dictNoChooselistPage(page);
//		}
//
//		mv.setViewName("trayBoxRel/info/trayBox_list");
//		mv.addObject("varList", varList);
//		mv.addObject("pd", pd);
//		return mv;
//	}
	/**
	 * 列表
	 */
	@RequestMapping
	public ModelAndView list(Page page) throws Exception {

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<PageData> varList = null;
		// 选择状态
		String CHOOSE_TYPE = pd.getString("CHOOSE_TYPE");
		pd.put("CHOOSE_TYPE", CHOOSE_TYPE);
		// 该托盘已经选中的零件名称
		if (CHOOSE_TYPE != null && "1".equals(CHOOSE_TYPE)) {
			varList = trayBoxRelService.dictChoosePartlistPage(page);
		}
		// 该托盘未被选中的零件名称
		if (CHOOSE_TYPE != null && "2".equals(CHOOSE_TYPE)) {
			varList = trayBoxRelService.dictNoChoosePartlistPage(page);
		}

		mv.setViewName("trayBoxRel/info/trayPart_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**
	 * 选中零件
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save(PrintWriter out) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();		
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		
		pd.put("ID", this.get32UUID());
		pd.put("State", "0"); // State
		pd.put("Registrant", user.getUSER_ID());
		pd.put("CreateTime", DateUtil.getTime());
		pd.put("CreateUser", user.getUSERNAME());
		//先判断托盘车的满载数
		//托盘车ID
		PageData pdp = new PageData();
		pdp = this.getPageData();
		String trayId = pd.getString("TrayId");
		pdp.put("ID", trayId);
		pdp.put("TrayId", trayId);
		//根据trayId获取该托盘的满载数
		pdp = trayInfoService.findById(pdp);
		int fullNum = 0;
		if(pdp.size()>0){
			//箱子满载数
//			String strFullNum = pdp.getString("FullNumber");
//			fullNum = Integer.parseInt(strFullNum);
			fullNum = 100;
		}
		//获取当前可以使用的零件列表
		Page pageData = new Page();
		pdp.put("TrayId", trayId);
		pageData.setPd(pdp);
		//根据托盘ID，获取该托盘的箱子总数量，以及箱子可以容纳的零件总数
		List<PageData> varBoxList  = trayPartRelService.findSelectBoxCount(pageData);
		if(fullNum>varBoxList.size()){
			trayBoxRelService.save(pd);
			mv.addObject("msg", "已选中");
		}else{
			mv.addObject("msg", "该托盘已满载。");
		}
		
		mv.setViewName("save_result");
		return mv;

	}

	/**
	 * 取消选中物料箱
	 */
	@RequestMapping(value = "/del")
	@ResponseBody
	public Object delete() {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		// 获取用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String errInfo = "";
		try {
			// 获取页面参数
			pd = this.getPageData();
			String strId = pd.getString("ID");
			if (strId != null && !"".equals(strId)) {
				pd.put("ID", strId.replace("'", ""));
			}

			pd.put("DeleteTime", DateUtil.getTime());
			pd.put("DeleteUser", user.getUSERNAME());
			// 调用删除方法
			trayBoxRelService.delete(pd);
			errInfo = "success";
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
}
