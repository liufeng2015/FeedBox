package com.fh.plugin;

import java.util.List;

import javax.annotation.Resource;

import com.fh.entity.Page;
import com.fh.service.BusinessLogic.BusinessLogicService;
import com.fh.service.PositionConfig.PositionConfigService;
import com.fh.service.box.BoxInfoService;
import com.fh.service.boxPartRel.BoxPartRelService;
import com.fh.service.log.LogInfoService;
import com.fh.service.part.PartInfoService;
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayPartRel.TrayPartRelService;
import com.fh.util.Logger;
import com.fh.util.PageData;

public class TimerDoRFID {
	protected Logger logger = Logger.getLogger(this.getClass());
	@Resource(name = "trayInfoService")
	private TrayInfoService trayInfoService;
	
	@Resource(name = "positionConfigService")
	private PositionConfigService positionConfigService;
	
	@Resource(name = "businessLogicService")
	private BusinessLogicService businessLogicService;

	@Resource(name = "boxPartRelService")
	private BoxPartRelService boxPartRelService;

	@Resource(name = "trayPartRelService")
	private TrayPartRelService trayPartRelService;

	@Resource(name = "partInfoService")
	private PartInfoService partInfoService;

	@Resource(name = "boxInfoService")
	private BoxInfoService boxInfoService;

	@Resource(name="logInfoService")
	private LogInfoService logInfoService;
	
	/**
	 * 
	 * @throws Exception
	 */
	public void show() throws Exception{  
//        System.out.println("-定时开始，准备调用线程-");  
//        //获取config配置表里面的数据信息
//        Page page = new Page();
//		List<PageData> varList = positionConfigService.getAllList(page);
//		
//        //根据配置表里的信息加载线程，读取各个点位的信息。
//        for(int i = 0 ; i<varList.size() ; i++){
//        	//获取参数
//        	String ip = varList.get(i).getString("IP");
//        	String port = varList.get(i).getString("PORT");
//        	//位置
//        	String strAddress = varList.get(i).getString("Address");
//            //状态
//        	String strState = varList.get(i).getString("State");
//        	//满箱状态
//        	String strFullState = varList.get(i).getString("FullState");
//        	//空箱状态
//        	String strEmptyState = varList.get(i).getString("EmptyState");
//        	//可使用空箱状态
//        	String strCanUseState = varList.get(i).getString("CanUseState");
//        	//待清洗箱状态
//        	String strDurtyState = varList.get(i).getString("DurtyState");
//        	//应报警状态
//        	String strAlertLight = varList.get(i).getString("AlertLight");
//        	String EP = varList.get(i).getString("EP");
//        	//开启线程        	
//        	RunnablePlugin runnable = new RunnablePlugin(
//        			  ip
//        			, port
//        			, strAddress
//        			, strState
//        			, strFullState
//        			, strEmptyState
//        			, strCanUseState
//        			, strDurtyState
//        			, strAlertLight
//        			, EP
//        			, businessLogicService
//        			, trayInfoService
//        			, trayPartRelService
//        			, boxInfoService
//        			, partInfoService
//        			, logInfoService);
//        	//创建线程  
//            Thread thread = new Thread(runnable, i+"");  
//            thread.start();
//            //强行中断
//            //thread.interrupt();  
//        }
    }  

}
