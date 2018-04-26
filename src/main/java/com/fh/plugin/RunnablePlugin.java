package com.fh.plugin;

import com.fh.service.BusinessLogic.BusinessLogicService;
import com.fh.service.box.BoxInfoService;
import com.fh.service.log.LogInfoService;
import com.fh.service.part.PartInfoService;
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayPartRel.TrayPartRelService;



public class RunnablePlugin implements Runnable {
    
	private String strIp = "";
	private String strPort = "";
	private String strAddress = "";
	private String strState = "";
	private String strFullState = "";
	private String strEmptyState = "";
	private String strCanUseState = "";
	private String strDurtyState = "";
	private String strAlertLight = "";
	private String EP = "";
	
	private BusinessLogicService businessLogicService;
	private TrayInfoService trayInfoService;
	private TrayPartRelService trayPartRelService;
	private BoxInfoService boxInfoService;
	private PartInfoService partInfoService;
	private LogInfoService logInfoService;

	/**
	 * 
	 * @param ip
	 * @param port
	 * @param address
	 * @param strState
	 * @param strFullState
	 * @param strEmptyState
	 * @param strCanUseState
	 * @param strDurtyState
	 * @param strAlertLight
	 * @param businessLogicService
	 * @param trayInfoService
	 * @param trayPartRelService
	 * @param boxInfoService
	 * @param partInfoService
	 * @param logInfoService
	 */
	public RunnablePlugin(String ip
			, String port
			, String address
			, String strState
			, String strFullState
			, String strEmptyState
			, String strCanUseState
			, String strDurtyState
			, String strAlertLight
			, String EP
			, BusinessLogicService businessLogicService
			, TrayInfoService trayInfoService
			, TrayPartRelService trayPartRelService
			, BoxInfoService boxInfoService
			, PartInfoService partInfoService
			, LogInfoService logInfoService) {
		this.strIp = ip;
		this.strPort = port;
		this.strAddress = address;
		this.strState = strState;
		this.strFullState = strFullState;
		this.strEmptyState = strEmptyState;
		this.strCanUseState = strCanUseState;
		this.strDurtyState = strDurtyState;
		this.strAlertLight = strAlertLight;
		this.EP=EP;
		this.businessLogicService  = businessLogicService;
		this.trayInfoService = trayInfoService;
		this.trayPartRelService = trayPartRelService;
		this.boxInfoService = boxInfoService;
		this.partInfoService = partInfoService;
		this.logInfoService = logInfoService;
	}

	/**
	 * 
	 */
	public void run() {
		System.out.println(Thread.currentThread().getName() + " 线程创建");
		try {
			BusinessLogic business = new BusinessLogic();
			business.checkIp(
					  strIp
					, strPort
					, strAddress
					, strState
					, strFullState
        			, strEmptyState
        			, strCanUseState
        			, strDurtyState
        			, strAlertLight
        			, EP
					, businessLogicService
					, trayInfoService
					, trayPartRelService
					, boxInfoService
					, partInfoService
					, logInfoService);
			Thread.sleep(50000);
		} catch (InterruptedException ex) {
			ex.printStackTrace(System.err);
		}
	}

}
