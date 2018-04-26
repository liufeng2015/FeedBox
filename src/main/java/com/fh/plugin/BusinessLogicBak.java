//package com.fh.plugin;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import java.util.Map;
//
//import com.fh.entity.Page;
//import com.fh.service.BusinessLogic.BusinessLogicService;
//import com.fh.service.box.BoxInfoService;
//import com.fh.service.part.PartInfoService;
//import com.fh.service.tray.TrayInfoService;
//import com.fh.service.trayPartRel.TrayPartRelService;
//import com.fh.util.DateUtil;
//import com.fh.util.Logger;
//import com.fh.util.PageData;
//import com.fh.util.UuidUtil;
//
///**
// * 
// * @author admin
// *
// */
//public class BusinessLogicBak {
//	
//	protected Logger logger = Logger.getLogger(this.getClass());	
//
//	/**
//	 * 根据IP和端口号，准备连接服务端
//	 * 
//	 * @param ip
//	 * @param port
//	 * @return
//	 */
//	public boolean checkIp(String ip
//			, String port
//			, String address
//			, String strState
//			, BusinessLogicService businessLogicService
//			, TrayInfoService trayInfoService
//			, TrayPartRelService trayPartRelService
//			, BoxInfoService boxInfoService
//			, PartInfoService partInfoService) {
//		boolean flag = false;
//		try {
//			System.out.println("------开始连接并读取数据--------");
//			int intPort = 0;
//			if (port != null && !"".equals(port)) {
//				intPort = Integer.parseInt(port);
//			} else {
//				flag = false;
//				return flag;
//			}
//			flag = timerReadWireless(ip, intPort,address,strState, businessLogicService,trayInfoService,trayPartRelService,boxInfoService, partInfoService);
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//			flag = false;
//		}
//		return flag;
//	}
//
//	/**
//	 * 连接服务端，按照位置扫描该位置下的托盘RFID
//	 * 
//	 * @param ip
//	 * @param port
//	 * @param strAddress
//	 * @param strState
//	 * @param businessLogicService
//	 * @param trayInfoService
//	 * @param trayPartRelService
//	 * @param boxInfoService
//	 * @param partInfoService
//	 * @return
//	 */
//	public boolean timerReadWireless(
//			  String ip
//			, int port
//			, String strAddress
//			, String strState
//			, BusinessLogicService businessLogicService
//			, TrayInfoService trayInfoService
//			, TrayPartRelService trayPartRelService
//			, BoxInfoService boxInfoService
//			, PartInfoService partInfoService) {
//		boolean flag = false;
//		try {
//			SocketRead socketRead = new SocketRead();
//			StringBuffer str = new StringBuffer();
//			str.append("A0");
//			str.append("04");
//			str.append("01");
//			str.append("89");
//			str.append("01");
//			str.append("D1");
//			str.append("00");
//			// 读取到的RFID编号
//			String result = socketRead.sendMessage(String.valueOf(str), ip,	port);
//			System.out.println("连接结束，IP为：" + ip+ ",端口号为：" + port+ "-----");
//			// 判断是否读取到EID数据
//			if (result != null && !"".equals(result)) {
//				List eidList = getEidList(result);
//				for(int i=0;i<eidList.size();i++){
//					String eid = (String) eidList.get(i);
//					//
//					if(!has(eid,trayInfoService)){
//						//根据EID，查询临时表中是否已存在					
//						List<PageData> list = getBusinessList(eid,businessLogicService);
//						
//						//如果存在，则校验当前服务器时间与插入时间间隔时间
//						for(int j=0;j<list.size();j++){
//							Date dateTime = (Date) list.get(j).get("CreateTime");
//							//如果创建时间与系统时间大于5分钟，则更新托盘和箱子的状态，并删除临时表数据
//							if(compareDate(dateTime)>5){
//								if(eid!=null && !"".equals(eid)){
//									//不重复判断：写日志：车的状态 根据配置表，更新托盘、物料箱的位置状态；调用报警灯闪烁；
//									doChangeState(eid,strAddress,strState,trayInfoService,trayPartRelService,boxInfoService, partInfoService);
//									doDelAndPartRel(eid,trayPartRelService,partInfoService,boxInfoService);
//									delBusinessByEid(eid,businessLogicService);
//								}
//							}
//						}
//						
//						//如果不存在，则插入临时表
//						if(list.size()==0){
//							PageData pd = new PageData();
//							pd.put("ID",  UuidUtil.get32UUID());
//							pd.put("EID", eid);
//							pd.put("ADDRESS", strAddress);
//							pd.put("CreateTime", DateUtil.getTime());
//							pd.put("CreateUser", "SYSTEM");
//							businessLogicService.save(pd);
//						}
//					}else {
//						// 调用报警灯
//						doAlert();
//					}
//				}
//				
//			} else {
//				// 调用报警灯
//				doAlert();
//			}
//			flag = true;
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//			flag = false;
//		}
//		return flag;
//	}
//
//	/**
//	 * 比较时间之间的时间差
//	 * 
//	 * @param startDate
//	 * @return
//	 */
//	public static long compareDate(Date startDate) {
//		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date begin;
//		Date end;
//		long allMinute = 0;
//		try {
//			begin = dfs.parse(dfs.format(startDate));
//			end = dfs.parse(dfs.format(new Date()));
//			long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒
//			long day1 = between / (24 * 3600);
//			long hour1 = between % (24 * 3600) / 3600;
//			long minute1 = between % 3600 / 60;
//			allMinute = day1*24+hour1*60+minute1;
//			System.out.println(allMinute);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return allMinute;
//	}
//	
//	
//	/**
//	 * 根据EID，查询临时表中是否已存在
//	 * 
//	 * @param eid
//	 * @param businessLogicService
//	 * @return
//	 */
//	public List<PageData> getBusinessList(String eid,BusinessLogicService businessLogicService){
//		List<PageData> listResult = new ArrayList();
//		PageData pd = new PageData();
//		pd.put("EID", eid);
//		try {
//			listResult = businessLogicService.listAllEidData(pd);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return listResult;
//	}
//	
//	/**
//	 * 根据EID，查询临时表中是否已存在
//	 * 
//	 * @param eid
//	 * @param businessLogicService
//	 * @return
//	 */
//	public void delBusinessByEid(String eid,BusinessLogicService businessLogicService){
//		List<PageData> listResult = new ArrayList();
//		PageData pd = new PageData();
//		pd.put("EID", eid);
//		try {
//			businessLogicService.delBusinessByEid(pd);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	
//	/**
//	 * 解析读取的字符串
//	 * 
//	 * @param eid
//	 * @return
//	 */
//	public ArrayList getEidList(String eid) {
//		ArrayList list = new ArrayList();
//		String[] data = eid.split("A0130189");
//		for (int i = 0; i < data.length; i++) {
//			if (data[i].length() >= 30) {
//				String strData = data[i].substring(6, 30);
//				System.out.println("EID==" + strData);
//				// 如果读取值为8900000000000000CC000000则是天线未读取到EID
//				if (!"8900000000000000CC000000".equals(strData)) {
//					list.add(strData);
//				}
//			}
//		}
//		return list;
//	}
//
//	/**
//	 * 不重复判断：写日志：车的状态 根据配置表，更新托盘、物料箱的位置状态；调用报警灯闪烁；
//	 * 
//	 * @param trayRFID
//	 * @param address
//	 * @param state
//	 * @throws Exception
//	 */
//	public void doChangeState(String trayRFID
//			, String address
//			, String state
//			, TrayInfoService trayInfoService
//			, TrayPartRelService trayPartRelService
//			, BoxInfoService boxInfoService
//			, PartInfoService partInfoService)
//			throws Exception {
//		// 编辑托盘车的状态和位置状态
//		PageData pd = new PageData();
//		pd.put("RFID", trayRFID);
//		pd.put("Address", address);
//		pd.put("State", state);
//		pd.put("UpdateTime", DateUtil.getTime());
//		pd.put("UpdateUser", "System");
//		trayInfoService.updateTrayState(pd);
//		insertLogInfo("托盘RFID为：'" + trayRFID + "'的状态信息变更为：'" + state	+ "'，位置变更为：" + address,partInfoService);
//		// 根据拖车EID获取所有可用箱子ID的信息，并按照时间顺序排序
//		Page pageData = new Page();
//		pd.put("TrayRFID", trayRFID);
//		pageData.setPd(pd);
//		List<Map<String, String>> boxIdList = new ArrayList<Map<String, String>>();
//		List<PageData> varBoxList = trayPartRelService.findSelectBoxCount(pageData);
//		// 获取该多盘下的箱子ID
//		for (int i = 0; i < boxIdList.size(); i++) {
//			String boxId = varBoxList.get(i).getString("BoxId");
//			String BoxQRCode = varBoxList.get(i).getString("BoxQRCode");
//			pd.put("BoxId", boxId);
//			// 编辑物料箱的位置状态
//			boxInfoService.updateBoxState(pd);
//			insertLogInfo("托盘RFID为：'" + trayRFID + "'的物料箱二维码为：'" + BoxQRCode
//					+ "'的状态变更为：" + state,partInfoService);
//		}
//	}
//
//	/**
//	 * 解除了零件与箱的关系数据，零件状态变已使用
//	 * 
//	 * @param trayRFID
//	 * @throws Exception
//	 */
//	public void doDelAndPartRel(String trayRFID
//			, TrayPartRelService trayPartRelService
//			, PartInfoService partInfoService
//			, BoxInfoService boxPartRelService) throws Exception {
//		PageData pd = new PageData();
//		Page pageData = new Page();
//		pd.put("TrayRFID", trayRFID);
//		pageData.setPd(pd);
//		// 根据拖车EID获取所有可用箱子ID的信息，并按照时间顺序排序
//		List<Map<String, String>> boxIdList = new ArrayList<Map<String, String>>();
//		List<PageData> varBoxList = trayPartRelService.findSelectBoxCount(pageData);
//		// 获取该多盘下的箱子ID
//		for (int i = 0; i < boxIdList.size(); i++) {
//			// 删除该箱子ID下与零件的关系数据
//			String boxId = varBoxList.get(i).getString("BoxId");
//			String BoxQRCode = varBoxList.get(i).getString("BoxQRCode");
//			pd.put("BoxId", boxId);
//			pd.put("State", "已使用");
//			pd.put("UpdateTime", DateUtil.getTime());
//			pd.put("UpdateUser", "System");
//			// 变更当前箱子ID下所有的零件状态为已使用
//			partInfoService.updatePartStateByBoxId(pd);
//			insertLogInfo("托盘RFID为：'" + trayRFID + "'的物料箱二维码：'" + BoxQRCode	+ "'中的零件状态变更为已使用。",partInfoService);
//			// 调用删除方法
//			boxPartRelService.delete(pd);
//			insertLogInfo("托盘RFID为：'" + trayRFID + "'的物料箱二维码：'" + BoxQRCode	+ "'中的零件关系都已删除。",partInfoService);
//		}
//
//	}
//
//	/**
//	 * 写log信息
//	 * 
//	 * @throws Exception
//	 */
//	public void insertLogInfo(String strInfo, PartInfoService partInfoService) throws Exception {
//		PageData pd = new PageData();
//		pd.put("CreateTime", DateUtil.getTime());
//		pd.put("CreateUser", "System");
//		pd.put("LOGID", UuidUtil.get32UUID()); // ID
//		pd.put("INFO", strInfo);
//		// 写日志
//		//partInfoService.saveLogInfo(pd);
//	}
//
//    /**
//	 * 判断扫中的标签EID是否已录入，如未录入则报警，已录入才可以操作状态
//	 * 
//	 * @param eid
//	 * @return
//	 */
//	public boolean has(String eid,TrayInfoService trayInfoService) {
//		boolean flag = false; // 返回false则重复，返回true则未重复
//		PageData pd = new PageData();
//		try {
//			pd.put("RFID", eid);
//			PageData data = trayInfoService.findRepeatCount(pd);
//			if(data!=null){
//				String id = data.getString("ID");
//				if (id != null && !"".equals(id)) {
//					flag = false;
//				} else {
//					flag = true;
//				}
//			}			
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}
//		return flag;
//	}
//
//	/**
//	 * 未读到EID数据，调用报警
//	 */
//	public void doAlert() {
//		System.out.print("==========报警操作============");
//	}
//}
