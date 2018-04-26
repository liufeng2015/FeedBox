package com.fh.controller.trayType;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.trayType.TrayTypeInfoService;
import com.fh.util.PageData;



@Controller
@RequestMapping(value = "/trayType")
public class TrayTypeController extends BaseController {


	@Resource(name = "trayTypeInfoService")
	TrayTypeInfoService trayTypeInfoService;
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> varList = trayTypeInfoService.getTrayList(page);		
		mv.setViewName("trayType/info/type_list");		
		mv.addObject("varList",varList);
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
			mv.setViewName("trayType/info/type_add");		
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
}
