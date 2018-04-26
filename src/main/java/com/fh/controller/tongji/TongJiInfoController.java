package com.fh.controller.tongji;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.tongji.TongJiInfoService;
import com.fh.util.DateUtil;
import com.fh.util.PageData;

/**
 * 类名称：TongJiInfoController 创建人：DJK 创建时间：2017年10月10日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/tongJiInfo")
public class TongJiInfoController extends BaseController {

	@Resource(name = "tongJiInfoService")
	private TongJiInfoService tongJiInfoService;
	
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
		List<PageData> varList = tongJiInfoService.getTrayList(page);
		List<PageData> listTable = tongJiInfoService.getStateCountList(page);
		mv.setViewName("tongji/info/tongji_list");
		
		mv.addObject("varList", varList);
		mv.addObject("listTable", listTable);
		mv.addObject("pd", pd);
		return mv;
	}
	

	/**
	 * 去按时间统计页面
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/tongji2")
	public ModelAndView toAdd(Page page) throws ParseException {
		ModelAndView mv = this.getModelAndView();
		//设置日期格式
		SimpleDateFormat startDf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startTime = startDf.format(new Date())+ " 04:30:00";
		String endTime =DateUtil.getPlusDays(startDf.format(new Date()),1)+ " 04:29:59";
		PageData pd = new PageData();
		
		String report="";
		try {
			pd = this.getPageData();
			if(pd.getString("startTime") != null && !"".equals(pd.getString("startTime")) && pd.getString("startTime").length()<=10){
				startTime=pd.getString("startTime")+ " 04:30:00";
			}
			if(pd.getString("endTime") != null && !"".equals(pd.getString("endTime")) && pd.getString("endTime").length()<=10){
				endTime=DateUtil.getPlusDays(pd.getString("endTime"),1)+ " 04:29:59";
			}
			pd.put("startTime", startTime);
			pd.put("endTime", endTime);
			page.setPd(pd);
			PageData varListXXGT = tongJiInfoService.getPartXXGT(page);
			PageData varListXXGG = tongJiInfoService.getPartXXGG(page);
			PageData varListXXPHZ = tongJiInfoService.getPartXXPHZ(page);
			PageData varListXXLG = tongJiInfoService.getPartXXLG(page);
			PageData varListXXQZ = tongJiInfoService.getPartXXQZ(page);
			
			List<PageData> varListSX = tongJiInfoService.getPartSX(page);
			if(DateUtil.getDaySub(startTime,endTime)<=1){
				
				
				
				
				
				pd.put("PartName", "ZK缸盖");
				PageData varListDayTJGG = tongJiInfoService.getDayTJ(page);
				mv.addObject("varListDayTJGG", varListDayTJGG);
				
				pd.put("PartName", "ZKG缸体");
				PageData varListDayTJGT = tongJiInfoService.getDayTJ(page);
				mv.addObject("varListDayTJGT", varListDayTJGT);
				
				pd.put("PartName", "AGW平衡轴");
				PageData varListDayTJPHZ = tongJiInfoService.getDayTJ(page);
				mv.addObject("varListDayTJPHZ", varListDayTJPHZ);
				
				pd.put("PartName", "PL连杆");
				PageData varListDayTJLG = tongJiInfoService.getDayTJ(page);
				mv.addObject("varListDayTJLG", varListDayTJLG);
				
				pd.put("PartName", "KW曲轴");
				PageData varListDayTJQZ = tongJiInfoService.getDayTJQZ(page);
				mv.addObject("varListDayTJQZ", varListDayTJQZ);
				
				
				mv.addObject("DaySub", "True");
				
			}
			
			
			mv.setViewName("tongji/info/tongji_list2");
			mv.addObject("varXXGT", varListXXGT);
			mv.addObject("varXXGG", varListXXGG);
			mv.addObject("varXXPHZ", varListXXPHZ);
			mv.addObject("varXXLG", varListXXLG);
			mv.addObject("varXXQZ", varListXXQZ);
			mv.addObject("varListSX", varListSX);
			
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		return mv;
	}
}
