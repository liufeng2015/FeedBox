package com.fh.plugin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.fh.entity.Page;
import com.fh.service.BusinessLogic.BusinessLogicService;
import com.fh.service.box.BoxInfoService;
import com.fh.service.log.LogInfoService;
import com.fh.service.part.PartInfoService;
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayPartRel.TrayPartRelService;
import com.fh.util.DateUtil;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

/**
 * 
 * @author admin
 *
 */
public class BusinessLogic {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	private StringBuffer str = new StringBuffer();//读取命令
	private StringBuffer str1 = new StringBuffer();//天线1
	private StringBuffer str2 = new StringBuffer();//天线2
	private StringBuffer str3 = new StringBuffer();//天线3
	private StringBuffer str4 = new StringBuffer();//天线4
	
	
	public BusinessLogic(){
		str.append("A0");
		str.append("04");
		str.append("01");
		str.append("89");
		str.append("01");
		str.append("D1");
		str.append("00");
		
		str1.append("A0");
		str1.append("04");
		str1.append("01");
		str1.append("74");
		str1.append("00");
		str1.append("E7");
		str1.append("00");
		
		str2.append("A0");
		str2.append("04");
		str2.append("01");
		str2.append("74");
		str2.append("01");
		str2.append("E6");
		str2.append("00");
		
		str3.append("A0");
		str3.append("04");
		str3.append("01");
		str3.append("74");
		str3.append("02");
		str3.append("E5");
		str3.append("00");
		
		str4.append("A0");
		str4.append("04");
		str4.append("01");
		str4.append("74");
		str4.append("03");
		str4.append("E4");
		str4.append("00");
		
		

		
	}

	/**
	 * 根据IP和端口号，准备连接服务端
	 * 
	 * @param ip
	 * @param port
	 * @param address
	 * @param strState  状态值
	 * @param strFullState  满箱状态值
	 * @param strEmptyState 空箱状态值
	 * @param strCanUseState 可用状态值
	 * @param strDurtyState  待清洗状态值
	 * @param strAlertLight  报警状态值
	 * @param businessLogicService
	 * @param trayInfoService
	 * @param trayPartRelService
	 * @param boxInfoService
	 * @param partInfoService
	 * @param logInfoService
	 * @return
	 */
	public boolean checkIp(String ip
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
		boolean flag = false;
		try {
			//System.out.println("------开始连接并读取数据--------");
			int intPort = 0;
			if (port != null && !"".equals(port)) {
				intPort = Integer.parseInt(port);
			} else {
				flag = false;
				return flag;
			}
			flag = timerReadWireless(
					  ip
					, intPort
					, address
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
		} catch (Exception e) {
			logger.error(e.toString(), e);
			flag = false;
		}
		return flag;
	}

	/**
	 * 连接服务端，按照位置扫描该位置下的托盘RFID
	 * 
	 * @param ip
	 * @param port
	 * @param strAddress
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
	 * @return
	 */
	public boolean timerReadWireless(
			  String ip
			, int port
			, String strAddress
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
		boolean flag = false;
		try {
			SocketRead socketRead = new SocketRead();
//			for(int c=1;c<5;c++){
				//if(c==1)socketRead.sendMessage(String.valueOf(str1), ip,	port);
				//if(c==2)socketRead.sendMessage(String.valueOf(str2), ip,	port);
				//if(c==3)socketRead.sendMessage(String.valueOf(str3), ip,	port);
				//if(c==4)socketRead.sendMessage(String.valueOf(str4), ip,	port);
				
				
			// 读取到的RFID编号
			String result = socketRead.sendMessage(String.valueOf(str), ip,	port);

			String result2 = socketRead.sendMessage(String.valueOf(str), ip,	port);

			String result3 = socketRead.sendMessage(String.valueOf(str), ip,	port);
			
			System.out.println("连接结束，IP为：" + ip+ ",端口号为：" + port+ "-----");
			
			
			// 判断是否读取到EID数据
			if (result != null && !"".equals(result)) {
				
				List eidList = getEidList(result);
				if (result2 != null && !"".equals(result2)) {
					List eidList2 = getEidList(result2);
					eidList.addAll(eidList2);
				}
				if (result3 != null && !"".equals(result3)) {
					List eidList3 = getEidList(result3);
					eidList.addAll(eidList3);
				}
				
				Set set=new HashSet();
				set.addAll(eidList);
				
				List newList=new ArrayList();
				newList.addAll(set);
				
				
				
				
				for(int i=0;i<newList.size();i++){
					String eid = (String) newList.get(i);
					//
					if(!has(eid,trayInfoService)){
						//根据EID，查询临时表中是否已存在					
						List<PageData> list = getBusinessList(eid,businessLogicService);
						
						//如果存在，则校验当前服务器时间与插入时间间隔时间
						for(int j=0;j<list.size();j++){
							Date dateTime = (Date) list.get(j).get("CreateTime");
							//如果创建时间与系统时间大于5分钟，则更新托盘和箱子的状态，并删除临时表数据
							if(compareDate(dateTime)>1||strAddress.indexOf("仓库")>1){
								if(eid!=null && !"".equals(eid)){
									//不重复判断：写日志：车的状态 根据配置表，更新托盘、物料箱的位置状态；调用报警灯闪烁；
									doChangeState(eid
											, strAddress
											, strState
											, strFullState
						        			, strEmptyState
						        			, strCanUseState
						        			, strDurtyState
						        			, strAlertLight
						        			, EP
											, trayInfoService
											, trayPartRelService
											, boxInfoService
											, partInfoService
											, logInfoService);
									delBusinessByEid(eid,businessLogicService);
								}
							}
						}
						
						//如果不存在，则插入临时表
						if(list.size()==0){
							PageData pd = new PageData();
							pd.put("ID",  UuidUtil.get32UUID());
							pd.put("EID", eid);
							pd.put("ADDRESS", strAddress);
							pd.put("CreateTime", DateUtil.getTime());
							pd.put("CreateUser", "SYSTEM");
							businessLogicService.save(pd);
						}
					}else {
						// 调用报警灯
						doAlert();
					}
				}
				
			} else {
				// 调用报警灯
				doAlert();
			}
			flag = true;

//			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
			flag = false;
		}
		return flag;
	}

	/**
	 * 比较时间之间的时间差
	 * 
	 * @param startDate
	 * @return
	 */
	public static long compareDate(Date startDate) {
		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date begin;
		Date end;
		long allMinute = 0;
		try {
			begin = dfs.parse(dfs.format(startDate));
			end = dfs.parse(dfs.format(new Date()));
			long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒
			long day1 = between / (24 * 3600);
			long hour1 = between % (24 * 3600) / 3600;
			long minute1 = between % 3600 / 60;
			allMinute = day1*24+hour1*60+minute1;
			//System.out.println(allMinute);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allMinute;
	}
	
	
	/**
	 * 根据EID，查询临时表中是否已存在
	 * 
	 * @param eid
	 * @param businessLogicService
	 * @return
	 */
	public List<PageData> getBusinessList(String eid,BusinessLogicService businessLogicService){
		List<PageData> listResult = new ArrayList();
		PageData pd = new PageData();
		pd.put("EID", eid);
		try {
			listResult = businessLogicService.listAllEidData(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listResult;
	}
	
	/**
	 * 根据EID，查询临时表中是否已存在
	 * 
	 * @param eid
	 * @param businessLogicService
	 * @return
	 */
	public void delBusinessByEid(String eid,BusinessLogicService businessLogicService){
		List<PageData> listResult = new ArrayList();
		PageData pd = new PageData();
		pd.put("EID", eid);
		try {
			businessLogicService.delBusinessByEid(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 解析读取的字符串
	 * 
	 * @param eid
	 * @return
	 */
	public ArrayList getEidList(String eid) {
		ArrayList list = new ArrayList();
		String[] data = eid.split("A0130189");
		for (int i = 0; i < data.length; i++) {
			if (data[i].length() >= 30) {
				String strData = data[i].substring(6, 30);
				System.out.println("EID==" + strData);
				// 如果读取值为8900000000000000CC000000则是天线未读取到EID
				if (!"8900000000000000CC000000".equals(strData)&&!"8922B0000000000000000000".equals(strData)&&!"890000000000000000000000".equals(strData)) {
					list.add(strData);
				}
			}
		}
		return list;
	}

	/**
	 * 不重复判断：写日志：车的状态 根据配置表，更新托盘、物料箱的位置状态；调用报警灯闪烁；
	 * 
	 * @param trayRFID
	 * @param address
	 * @param state
	 * @param strFullState
	 * @param strEmptyState
	 * @param strCanUseState
	 * @param strDurtyState
	 * @param strAlertLight
	 * @param trayInfoService
	 * @param trayPartRelService
	 * @param boxInfoService
	 * @param partInfoService
	 * @param logInfoService
	 * @throws Exception
	 */
	public void doChangeState(String trayRFID
			, String address
			, String state
			, String strFullState
			, String strEmptyState
			, String strCanUseState
			, String strDurtyState
			, String strAlertLight
			, String EP
			, TrayInfoService trayInfoService
			, TrayPartRelService trayPartRelService
			, BoxInfoService boxInfoService
			, PartInfoService partInfoService
			, LogInfoService logInfoService)
			throws Exception {
		
		//根据托盘RFID获取托盘ID
		PageData pd = new PageData();
		pd.put("RFID", trayRFID);
		PageData trayData = getTrayId(pd, trayInfoService);
		//托盘ID
		String trayId = "";
		//托盘名
		String trayName = "";
		//托盘状态
		String strState = "";
		
		String trayType="";
		
		if(trayData != null){
			trayId = trayData.getString("ID");
			trayName = trayData.getString("TrayName");
			strState = trayData.getString("State");

			trayType = trayData.getString("TrayType");
		}
		
		if(address != null && !"".equals(address)){
			if(address.indexOf("下线点") >= 0){
				
				
			}
		}
		
		//位置为上线点的操作
		//1、托盘状态变已清洗，托盘位置变上线点
		//根据托盘RFID更新该沱牌的位置和状态
		if(address != null && !"".equals(address)){
			if(address.indexOf("上线点") >= 0){
						
//				pd.put("TrayId", trayId);
//				//2、根据托盘ID找到零件，并把零件变已使用状态
//				List<PageData> partList = partInfoService.getPartListByTrayId(pd);
//				if(partList != null){
//					for(int i=0;i<partList.size();i++){
//						pd.put("partId", partList.get(i).get("ID"));
//						pd.put("State", "已使用");
//						pd.put("UpdateTime", DateUtil.getTime());
//						pd.put("UpdateUser", "System");
//						pd.put("TrayId", "");
//						partInfoService.updatePartStateByPartId(pd);
//					}
//				}
				
			}
		}
		
		if(address != null && !"".equals(address)){
			if(address.indexOf("外库") >= 0){
				//1、托盘状态变待使用空箱，托盘位置变清洗点
				
				
			}
		}
		
		
		
		//位置为清洗点的操作		
		if(address != null && !"".equals(address)){
			if(address.indexOf("清洗点") >= 0){
				//1、托盘状态变待使用空箱，托盘位置变清洗点
				
				
			}
		}
		
		
		//位置为仓库点出入口的操作
		if(address != null && !"".equals(address)){
			if(address.indexOf("仓库") >= 0){
				//1、托盘状态变待使用空箱，托盘位置变该仓库点
				
				
			}
		}
		

		//位置为清洗点的操作		
		if(address != null && !"".equals(address)){
			if(address.indexOf("码头") >= 0){
				
				
			}
		}
		
		pd.put("ID", trayId);
		pd.put("Address", address);
		pd.put("EP", EP);

		if(strState==null || "null".equals(strState) || "".equals(strState)){
			pd.put("State", strEmptyState);
		}else
		if(strState.indexOf("空箱")>=0){
			pd.put("State", strEmptyState);
		}else
		if(strState.indexOf("满箱")>=0){
			pd.put("State", strFullState);		
		}else
		if(strState.indexOf("待清洗")>=0){
			pd.put("State", strDurtyState);
		}else
		if(strState.indexOf("待使用")>=0){
			pd.put("State", strCanUseState);
		}
		
		
		if(trayData!=null){
			String TrayAddress="";
			if(trayData.getString("Address")!=null){
				TrayAddress=trayData.getString("Address");
			}
			if(!TrayAddress.equals(address)){
			
				pd.put("UpdateTime", DateUtil.getTime());
				pd.put("UpdateUser", "System");
				saveTrayAddressState(trayInfoService, pd);	
				
				//3、写日志
				pd.put("LOGID", UuidUtil.get32UUID()); // ID
				pd.put("DR", 0);
				pd.put("CreateTime", DateUtil.getTime());			
				pd.put("CreateUser", "System");			
				pd.put("TYPE", trayType);
				pd.put("STATE", pd.get("State"));
				pd.put("ADDRESS", address);
				pd.put("INFO", "编辑托盘：‘"+trayName+"’的内容为"+pd.get("State")+"，位置在"+address);
				pd.put("trayId", trayId);
				
				//写日志
				logInfoService.saveLogInfo(pd);	
			}
		}
	}

	/**
	 * @param trayRFID
	 * @param trayInfoService
	 * @throws Exception
	 */
	private PageData getTrayId(PageData pd, TrayInfoService trayInfoService)
			throws Exception {		
		PageData data = trayInfoService.findRepeatCount(pd);		
		return data;		
	}

	/**
	 * 保存托盘的位置和状态
	 * @param trayInfoService
	 * @param pd
	 * @throws Exception
	 */
	private void saveTrayAddressState(TrayInfoService trayInfoService,
			PageData pd) throws Exception {
		//编辑托盘状态和托盘位置
		trayInfoService.updateTrayState(pd);
	}

    /**
	 * 判断扫中的标签EID是否已录入，如未录入则报警，已录入才可以操作状态
	 * 
	 * @param eid
	 * @return
	 */
	public boolean has(String eid,TrayInfoService trayInfoService) {
		boolean flag = false; // 返回false则重复，返回true则未重复
		PageData pd = new PageData();
		try {
			pd.put("RFID", eid);
			PageData data = trayInfoService.findRepeatCount(pd);
			if(data!=null){
				String id = data.getString("ID");
				if (id != null && !"".equals(id)) {
					flag = false;
				} else {
					flag = true;
				}
			}			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return flag;
	}

	/**
	 * 未读到EID数据，调用报警
	 */
	public void doAlert() {
		//System.out.print("==========报警操作============");
	}
}
