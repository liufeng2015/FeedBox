package com.fh.controller.partConfig;

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
import com.fh.plugin.BusinessLogic;
import com.fh.service.BusinessLogic.BusinessLogicService;
import com.fh.service.PositionConfig.PositionConfigService;
import com.fh.service.box.BoxInfoService;
import com.fh.service.log.LogInfoService;
import com.fh.service.part.PartInfoService;
import com.fh.service.partConfig.PartConfigService;
import com.fh.service.system.user.UserService;
import com.fh.service.tray.TrayInfoService;
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
@RequestMapping(value = "/partConfig")
public class PartConfigController extends BaseController {

	@Resource(name = "partConfigService")
	private PartConfigService partConfigService;
	
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

		String PC_ID = pd.getString("PC_ID");

		//校验公司名是否重复
        
		if (null != PC_ID && !"".equals(PC_ID)) {
			pd.put("PC_ID", PC_ID);
			pd.put("UpdateTime", DateUtil.getTime());
			pd.put("UpdateUser", user.getUSERNAME());
			partConfigService.edit(pd);
		} else {
			pd.put("PC_ID", this.get32UUID()); // ID
			pd.put("DR", 0);
			pd.put("CreateTime", DateUtil.getTime());
			pd.put("CreateUser", user.getUSERNAME());
			partConfigService.save(pd);
					
			
		}

		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;

	}

	
	@RequestMapping(value = "/has")
	public void has(PrintWriter out) {
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			PageData data = partConfigService.findByIP(pd);
			if(data!=null){
				out.write("error");
				out.close();
			}else{
				out.write("success");
				out.close();
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

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


		page.setPd(pd);
		List<PageData> varList = partConfigService.dictlistPage(page);

		mv.setViewName("partConfig/list");
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
			mv.setViewName("partConfig/edit");
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
		pd = partConfigService.findById(pd);
		mv.setViewName("partConfig/edit");
		mv.addObject("pd", pd);
		return mv;
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
			
			//删除参数
			partConfigService.delete(pd);			
			errInfo = "success";
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		
		return AppUtil.returnObject(new PageData(), map);
	}


}
