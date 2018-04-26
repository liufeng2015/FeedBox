package com.fh.controller.statistics;

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
@RequestMapping(value="/statistics")
public class StatisticsController extends BaseController {


	@Resource(name="enterpriseService")
	private EnterpriseService enterpriseService;
	
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/enterpriseTax")
	public ModelAndView enterpriseTax(Page page)throws Exception{

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);				
		List<PageData> varList = enterpriseService.dictlistPageByEnterpriseTax(page);
		mv.setViewName("statistics/enterpriseTax");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}


	@RequestMapping(value="/enterpriseOutputValue")
	public ModelAndView list(Page page)throws Exception{
	
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);				
		List<PageData> varList = enterpriseService.dictlistPageByEnterpriseOutputValue(page);
		mv.setViewName("statistics/enterpriseOutputValue");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
}
