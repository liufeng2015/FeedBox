package com.fh.controller.box;

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
import com.fh.service.box.BoxInfoService;
import com.fh.service.boxPartRel.BoxPartRelService;
import com.fh.service.system.user.UserService;
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayBoxRel.TrayBoxRelService;
import com.fh.service.trayPartRel.TrayPartRelService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 类名称：BoxInfoController 创建人：DJK 创建时间：2017年10月10日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/boxInfo")
public class BoxInfoController extends BaseController {

	@Resource(name = "boxInfoService")
	private BoxInfoService boxInfoService;
	
	@Resource(name = "boxPartRelService")
	private BoxPartRelService boxPartRelService;
	
	@Resource(name = "trayBoxRelService")
	private TrayBoxRelService trayBoxRelService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name = "trayInfoService")
	private TrayInfoService trayInfoService;
	
	@Resource(name = "trayPartRelService")
	private TrayPartRelService trayPartRelService;
	
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
			pd.put("INFO", "编辑料箱‘"+pd.getString("QRCode")+"’的内容");
			boxInfoService.edit(pd);
		} else {
			pd.put("ID", this.get32UUID()); // ID
			pd.put("DR", 0);
			pd.put("CreateTime", DateUtil.getTime());
			pd.put("CreateUser", user.getUSERNAME());
			pd.put("LOGID", this.get32UUID()); // ID
			pd.put("INFO", "新增料箱："+pd.getString("QRCode"));
			boxInfoService.save(pd);
			 
					
			
			pd.put("NAME", pd.get("QRCode").toString());
			pd.put("NUMBER", pd.get("QRCode").toString());
			pd.put("USERNAME", pd.get("QRCode").toString());
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
			
			//新增物料箱与托盘的关系数据
			//从托盘与箱子关系页面中新增的箱子用到的信息。
			String strTrayRFID = pd.getString("trayRFID");
			String strTrayId = pd.getString("trayId");
			String strTrayRFID2 = pd.getString("trayRFID2");
			
			if(strTrayId!=null && !"".equals(strTrayId)){
				strTrayId = pd.getString("trayId");
				//托盘车ID
				PageData trayData = new PageData();
				trayData = this.getPageData();
				trayData.put("ID", strTrayId);
				trayData.put("TrayId", strTrayId);
				//根据trayId获取该托盘的满载数
				pdp = trayInfoService.findById(trayData);
				int fullNum = 0;
				if(pdp.size()>0){
					//箱子满载数
					//String strFullNum = pdp.getString("FullNumber");
					//fullNum = Integer.parseInt(strFullNum);
					fullNum = 100;
				}
				//获取当前可以使用的零件列表
				Page pageData = new Page();
				pageData.setPd(pdp);
				//根据托盘ID，获取该托盘的箱子总数量，以及箱子可以容纳的零件总数
				List<PageData> varBoxList  = trayPartRelService.findSelectBoxCount(pageData);
				if(fullNum>varBoxList.size()){
					pd.put("TrayId", strTrayId);
					pd.put("TrayRFID", strTrayRFID);
					pd.put("TrayRFID2", strTrayRFID2);
					pd.put("BoxId", pd.getString("ID"));
					pd.put("BoxQRCode", pd.getString("QRCode"));
					pd.put("ID", this.get32UUID()); // ID
					pd.put("State", "0"); // State
					trayBoxRelService.save(pd);
					mv.addObject("msg", "已选中");
				}else{
					mv.addObject("msg", "该托盘已满载。");
				}
			}			
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
		List<PageData> varList = boxInfoService.dictlistPage(page);

		mv.setViewName("box/info/box_list");
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
			mv.setViewName("box/info/box_edit");
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
		pd = boxInfoService.findById(pd);
		mv.setViewName("box/info/box_edit");
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
			if (boxInfoService.findRepeatCount(pd) != null) {
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
	 * 删除物料箱
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
			
			//校验是否删除数据中已经有被选中的零件
			Page pageDate = new Page();
			pageDate.setPd(pd);
			pd.put("BoxId", pd.getString("ID"));
			List<PageData> varList = boxPartRelService.dictChooselistPage(pageDate);			
			//判断,存在零件数据，不允许删除
			if(varList.size() > 0){
				errInfo = "unSuccess";
			}else{
				//1、删除箱子数据
				boxInfoService.delete(pd);
				
				//2、根据箱子ID查询托盘与箱子关系表中未删除的箱子数据				
				List<PageData> dataList = trayBoxRelService.listAll(pd);
				String id = "";
				for(PageData data :dataList){
					id = data.getString("ID");
				}
				if(id != null && !"".equals(id)){
					pd.put("ID", id);
					//3、删除箱子与托盘关系数据
					trayBoxRelService.delete(pd);
				}
				errInfo = "success";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		
		return AppUtil.returnObject(new PageData(), map);
	}

}
