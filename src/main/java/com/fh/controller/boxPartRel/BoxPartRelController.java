package com.fh.controller.boxPartRel;

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
import com.fh.service.boxPartRel.BoxPartRelService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;

/**
 * 类名称：BoxPartRelController 创建人：DJK 创建时间：2017年10月11日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/boxPartRelInfo")
public class BoxPartRelController extends BaseController {
	
	@Resource(name = "boxPartRelService")
	private BoxPartRelService boxPartRelService;
	
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
		// 该项目已经选中的物料箱名称
		if (CHOOSE_TYPE != null && "1".equals(CHOOSE_TYPE)) {
			varList = boxPartRelService.dictChooselistPage(page);
		}
		// 该项目未被选中的物料箱名称
		if (CHOOSE_TYPE != null && "2".equals(CHOOSE_TYPE)) {
			varList = boxPartRelService.dictNoChooselistPage(page);
		}

		mv.setViewName("boxPartRel/info/boxPart_list");
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
		PageData pdp = new PageData();
		pdp = this.getPageData();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		
		pd.put("ID", this.get32UUID()); // ID
		pd.put("State", "0"); // State
		pd.put("Registrant", user.getUSER_ID());
		pd.put("CreateTime", DateUtil.getTime());
		pd.put("CreateUser", user.getUSERNAME());
		boxPartRelService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;

	}

	/**
	 * 取消选中零件
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
			boxPartRelService.delete(pd);
			errInfo = "success";
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
}
