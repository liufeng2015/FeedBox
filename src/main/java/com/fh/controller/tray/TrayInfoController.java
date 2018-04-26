package com.fh.controller.tray;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
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
import com.fh.plugin.BusinessLogic;
import com.fh.plugin.SocketRead;
import com.fh.service.log.LogInfoService;
import com.fh.service.system.user.UserService;
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayBoxRel.TrayBoxRelService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.Tools;

/**
 * 类名称：TrayInfoController 创建人：DJK 创建时间：2017年10月10日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/trayInfo")
public class TrayInfoController extends BaseController {

	@Resource(name = "trayInfoService")
	private TrayInfoService trayInfoService;
	
	@Resource(name = "trayBoxRelService")
	private TrayBoxRelService trayBoxRelService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="logInfoService")
	private LogInfoService logInfoService;
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
			pd.put("INFO", "编辑托盘：‘"+pd.getString("TrayName")+"’的内容");
			trayInfoService.edit(pd);
			
//			//写日志
//			pd.put("LOGID", this.get32UUID()); // ID
//			pd.put("DR", 0);
//			pd.put("CreateTime", DateUtil.getTime());			
//			pd.put("CreateUser", user.getUSERNAME());			
//			pd.put("TYPE", "托盘");
//			pd.put("STATE", "待使用空箱");
//			pd.put("ADDRESS", "托盘管理");
//			pd.put("INFO", "编辑托盘：‘"+pd.getString("TrayName")+"’的内容");
//			//写日志
//			logInfoService.saveLogInfo(pd);
		} else {
			pd.put("ID", this.get32UUID()); // ID
			pd.put("DR", 0);
			pd.put("CreateTime", DateUtil.getTime());
			pd.put("CreateUser", user.getUSERNAME());
			pd.put("LOGID", this.get32UUID()); // ID
			pd.put("INFO", "新增托盘名："+pd.getString("TrayName"));
			trayInfoService.save(pd);
//			
//			//写日志
//			pd.put("LOGID", this.get32UUID()); // ID
//			pd.put("DR", 0);
//			pd.put("CreateTime", DateUtil.getTime());			
//			pd.put("CreateUser", user.getUSERNAME());			
//			pd.put("TYPE", "托盘");
//			pd.put("STATE", "待使用空箱");
//			pd.put("ADDRESS", "托盘管理");
//			pd.put("INFO", "新增托盘：‘"+pd.getString("TrayName")+"’的内容");
//			//写日志
//			logInfoService.saveLogInfo(pd);
//					
//			
//			pd.put("NAME", pd.get("TrayName").toString());
//			pd.put("NUMBER", pd.get("TrayName").toString());
//			pd.put("USERNAME", pd.get("TrayName").toString());
//			pd.put("PASSWORD", "e7998e285ec909bfb90b47aee4540a3d27bfb6e3");
//			
//			//pd.put("PHONE", pd.get("ContactsTel").toString());
//			pd.put("EMAIL", "");
//			pd.put("BZ", "");
//			pd.put("ROLE_ID", "3cf6bfe346574aae914867d5815c3439");
//			pd.put("USER_ID", this.get32UUID());	//ID
//			pd.put("RIGHTS", "");					//权限
//			pd.put("LAST_LOGIN", "");				//最后登录时间
//			pd.put("IP", "");						//IP
//			pd.put("STATUS", "");					//状态
//			pd.put("SKIN", "default");				//默认皮肤
//			
//			pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), "123").toString());
//			String menuUrl = "user/listUsers.do";
//			if(Jurisdiction.buttonJurisdiction(menuUrl, "add")){userService.saveU(pd);} //判断新增权限
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
		List<PageData> varList = trayInfoService.dictlistPage(page);

		mv.setViewName("tray/info/tray_list");
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
			mv.setViewName("tray/info/tray_edit");
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
		pd = trayInfoService.findById(pd);
		mv.setViewName("tray/info/tray_edit");
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
			PageData data = trayInfoService.findRepeatCount(pd);
			if(data!=null){
				String id = data.getString("ID");
				if (id != null && !"".equals(id)) {
					out.write("error");
				} else {
					out.write("success");
				}
				out.close();
			}			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

	}

	/**
	 * 删除托盘
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
			pd.put("TrayId", pd.get("ID"));
			pageDate.setPd(pd);
			List<PageData> varList = trayBoxRelService.dictChooselistPage(pageDate);			
			//判断,存在数据，不允许删除
			if(varList.size() > 0){
				errInfo = "unSuccess";		
			}else{
				trayInfoService.delete(pd);
				errInfo = "success";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 读取Rfid值
	 * @throws IOException 
	 * @throws UnknownHostException 
	 */
	@RequestMapping(value = "/readRfidDate")
	public void readRfidDate(PrintWriter out) throws UnknownHostException, IOException {
		SocketRead socketRead = new SocketRead();
		StringBuffer str = new StringBuffer();
		str.append("A0");
		str.append("04");
		str.append("01");
		str.append("89");
		str.append("01");
		str.append("D1");
		str.append("00");
		String ipPort = Tools.readTxtFile(Const.IPPORT);	 //读取IP和端口号
		String[] ipdata = ipPort.split(":");
		String ip = ipdata[0];
		int port = Integer.parseInt(ipdata[1]);
		String result = socketRead.sendMessage(String.valueOf(str),ip,port);
		//out.write("E2004080671800541380893D");
		if(result != null && !"".equals(result)){
			BusinessLogic getEid = new BusinessLogic();
			List list = getEid.getEidList(result);
			String returnData = "";
			if(list.size()>=2){
				returnData = list.get(0)+";"+list.get(1);
			}else if(list.size() == 1){
				returnData = list.get(0)+";";
			}else{
				returnData = "error";
			}
			out.write(returnData);
		}
		

	}
}
