package com.fh.controller.printTrayPart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.log.LogInfoService;
import com.fh.service.printTrayPart.PrintTrayPartInfoService;
import com.fh.service.system.user.UserService;
import com.fh.util.PageData;

/**
 * 类名称：PrintTrayPartInfoController 创建人：DJK 创建时间：2017年10月10日
 * 
 * 已打印零件信息查看
 * @version
 */
@Controller
@RequestMapping(value = "/printTrayPartInfo")
public class PrintTrayPartInfoController extends BaseController {

	@Resource(name = "printTrayPartInfoService")
	private PrintTrayPartInfoService printTrayPartInfoService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="logInfoService")
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
		List<PageData> varList = printTrayPartInfoService.dictlistPage(page);

		mv.setViewName("trayPartRel/info/printTrayPartInfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);

		return mv;
	}

}
