package com.fh.controller.log;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.log.LogInfoService;
import com.fh.util.PageData;

/**
 * 类名称：LogService 创建人：DJK 创建时间：2017年8月9日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/logInfo")
public class LogInfoController extends BaseController {

	@Resource(name = "logInfoService")
	private LogInfoService logInfoService;

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
		List<PageData> varList = logInfoService.dictlistPage(page);

		mv.setViewName("log/info/log_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);

		return mv;
	}
}
