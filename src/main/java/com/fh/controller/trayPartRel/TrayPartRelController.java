package com.fh.controller.trayPartRel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.bindingBox.BindingBoxInfoService;
import com.fh.service.bindingBox.BindingBoxService;
import com.fh.service.boxPartRel.BoxPartRelService;
import com.fh.service.log.LogInfoService;
import com.fh.service.part.PartInfoService;
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayPartRel.TrayPartRelService;
import com.fh.util.AppUtil;
import com.fh.util.DateUtil;
import com.fh.util.PageData;

/** 
 * 类名称：TrayPartRelController 创建人：DJK 创建时间：2017年10月11日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/trayPartRelInfo")
public class TrayPartRelController extends BaseController {
	
	@Resource(name = "trayPartRelService")
	private TrayPartRelService trayPartRelService;
	
	@Resource(name = "partInfoService")
	private PartInfoService partInfoService;
	
	@Resource(name = "boxPartRelService")
	private BoxPartRelService boxPartRelService;
	
	@Resource(name = "trayInfoService")
	private TrayInfoService trayInfoService;
	
	@Resource(name="logInfoService")
	private LogInfoService logInfoService;
	
	@Resource(name="bindingBoxService")
	private BindingBoxService bindingBoxService;
	

	@Resource(name="bindingBoxInfoService")
	private BindingBoxInfoService bindingBoxInfoService;
	
	
	
	/**
	 * 列表
	 */
	@RequestMapping
	public ModelAndView list(Page page) throws Exception {

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
//
//		Subject currentUser = SecurityUtils.getSubject();
//		Session session = currentUser.getSession();
//		User user = (User) session.getAttribute(Const.SESSION_USER);
//		
//		
//		pd.put("Address", user.getBZ());
		
		
		String Address=pd.getString("Address");
		pd.put("State", "空箱");
		List<PageData> varList = null;
		page.setPd(pd);
		varList = trayPartRelService.getTrayListPage(page);
		
		
		if(pd.getString("Address").indexOf("平衡轴")>=0){
//			mv.setViewName("trayPartRel/info/trayPartRelPHZ_list");
			mv.setViewName("trayPartRel/info/trayPartRelQZ_list");
			pd.put("FullNumber", 96);
//			pd = getQRDataPHZ(pd);
		}else
		if(pd.getString("Address").indexOf("缸体")>=0){
//			mv.setViewName("trayPartRel/info/trayPartRelGT_list");
			mv.setViewName("trayPartRel/info/trayPartRelQZ_list");
			pd.put("FullNumber", 24);
//			pd = getQRDataGT(pd);
		}else
		if(pd.getString("Address").indexOf("缸盖")>=0){
//			mv.setViewName("trayPartRel/info/trayPartRelPHZ_list");
			mv.setViewName("trayPartRel/info/trayPartRelQZ_list");
			pd.put("FullNumber", 24);
//			pd = getQRDataGG(pd);
		}else
		if(pd.getString("Address").indexOf("曲轴")>=0){
			mv.setViewName("trayPartRel/info/trayPartRelQZ_list");
			pd.put("FullNumber", 24);
//			pd = getQRDataQZ(pd);
			
		}else
		if(pd.getString("Address").indexOf("连杆")>=0){
//			mv.setViewName("trayPartRel/info/trayPartRelLG_list");
			mv.setViewName("trayPartRel/info/trayPartRelQZ_list");
			pd.put("FullNumber", 386);
//			pd = getQRDataLG(pd);
		}
		
		
		pd.put("State", "未使用");
		List<PageData> varList2  = partInfoService.getPartListAll(pd);
		
		pd.put("AllC", partInfoService.getPartListAllC(pd).get("AllC"));
		if(varList2!=null && varList2.size()>0){
			String QRCode=varList2.get(0).get("QRCode").toString();
			//String CreateTime=varList2.get(0).get("CreateTime").toString();
			pd.put("CreateTime", varList2.get(0).get("CreateTime"));
			pd.putAll(getQRData(QRCode));
		}
		varList2=updateQRCode(varList2);
		List<PageData> varList3=new ArrayList<PageData>();
		if(varList2.size()>12){
			for(int i=12;i<varList2.size();i++){
				varList3.add(varList2.get(i));
			}
		}
		
		mv.addObject("varList", varList);

		mv.addObject("varList2", varList2);

		mv.addObject("varList3", varList3);
		
		PageData pdd =  new PageData();
		pdd.putAll(pd);
		
		if(pdd.getString("Address").indexOf("EP3曲轴")>-1){
			pdd.put("Address", "EP3曲轴下线点");
		}
		
		if(pdd.getString("Address").indexOf("EP1平衡轴")>-1){
			pdd.put("Address", "EP1平衡轴下线点");
		}
		
		String No=String.valueOf(bindingBoxService.getNo(pdd).get("No"));
		pd.put("No", No);
		String AddressName=this.getAddressShow(pd.getString("Address"));
		pd.put("AddressName", AddressName);
		
		mv.addObject("pd", pd);
		return mv;
	}
//	
//	/**
//	 * 列表-缸体
//	 */
//	@RequestMapping(value = "/listGT")
//	public ModelAndView listGT(Page page) throws Exception {
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		pd.put("State", "空箱");
//		
//		page.setPd(pd);
//		List<PageData> varList = null;
//		varList = trayPartRelService.getTrayListPage(page);
////		pd = getQRDataGT(pd);
//		//缸体
//		mv.setViewName("trayPartRel/info/trayPartRelGT_list");
//		mv.addObject("varList", varList);
//		mv.addObject("pd", pd);
//		return mv;
//	}
//	
//	/**
//	 * 列表-缸盖
//	 */
//	@RequestMapping(value = "/listGG")
//	public ModelAndView listGG(Page page) throws Exception {
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		pd.put("State", "空箱");
//		
//		page.setPd(pd);
//		List<PageData> varList = null;
//		varList = trayPartRelService.getTrayListPage(page);
//		pd = getQRDataGG(pd);
//		//缸盖
//		mv.setViewName("trayPartRel/info/trayPartRelGG_list");
//		mv.addObject("varList", varList);
//		mv.addObject("pd", pd);
//		return mv;
//	}
//	
//	/**
//	 * 列表-连杆
//	 */
//	@RequestMapping(value = "/listLG")
//	public ModelAndView listLG(Page page) throws Exception {
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		pd.put("State", "空箱");
//		
//		page.setPd(pd);
//		List<PageData> varList = null;
//		varList = trayPartRelService.getTrayListPage(page);
//		pd = getQRDataLG(pd);
//		//连杆
//		mv.setViewName("trayPartRel/info/trayPartRelLG_list");
//		mv.addObject("varList", varList);
//		mv.addObject("pd", pd);
//		return mv;
//	}
//	
//	/**
//	 * 列表-曲轴
//	 */
//	@RequestMapping(value = "/listQZ")
//	public ModelAndView listQZ(Page page) throws Exception {
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		pd.put("State", "空箱");
//		
//		page.setPd(pd);
//		List<PageData> varList = null;
//		varList = trayPartRelService.getTrayListPage(page);
//		pd = getQRDataQZ(pd);
//		//曲轴
//		mv.setViewName("trayPartRel/info/trayPartRelQZ_list");
//		mv.addObject("varList", varList);
//		mv.addObject("pd", pd);
//		return mv;
//	}
	
//	/**
//	 * 选中物料箱
//	 */
//	@RequestMapping(value = "/save")
//	public ModelAndView save(PrintWriter out) throws Exception {
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		PageData pdp = new PageData();
//		pdp = this.getPageData();
//		Subject currentUser = SecurityUtils.getSubject();
//		Session session = currentUser.getSession();
//		User user = (User) session.getAttribute(Const.SESSION_USER);
//		
//		pd.put("ID", this.get32UUID()); // ID
//		pd.put("State", "0"); // State
//		pd.put("Registrant", user.getUSER_ID());
//		pd.put("CreateTime", DateUtil.getTime());
//		pd.put("CreateUser", user.getUSERNAME());
//		trayPartRelService.save(pd);
//		mv.addObject("msg", "success");
//		mv.setViewName("save_result");
//		return mv;
//
//	}
//
//	/**18017025270
//	 * 取消选中物料箱
//	 */
//	@RequestMapping(value = "/del")
//	@ResponseBody
//	public Object delete() {
//		Map<String, String> map = new HashMap<String, String>();
//		PageData pd = new PageData();
//		// 获取用户信息
//		Subject currentUser = SecurityUtils.getSubject();
//		Session session = currentUser.getSession();
//		User user = (User) session.getAttribute(Const.SESSION_USER);
//		String errInfo = "";
//		try {
//			// 获取页面参数
//			pd = this.getPageData();
//			String strId = pd.getString("ID");
//			if (strId != null && !"".equals(strId)) {
//				pd.put("ID", strId.replace("'", ""));
//			}
//
//			pd.put("DeleteTime", DateUtil.getTime());
//			pd.put("DeleteUser", user.getUSERNAME());
//			// 调用删除方法
//			trayPartRelService.delete(pd);
//			errInfo = "success";
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}
//		map.put("result", errInfo);
//		return AppUtil.returnObject(new PageData(), map);
//	}
	
	/**
	 * 获取所有的可用零件信息
	 */
//	@RequestMapping(value = "/getAllPartData")
//	@ResponseBody
//	public Object getAllPartData() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		PageData pd = new PageData();
//
//		
//		try {
//			// 获取页面参数
//			pd = this.getPageData();
//			//获取当前可以使用的零件列表
//			Page pageData = new Page();
//			pageData.setPd(pd);
//			List<PageData> varList  = partInfoService.getPartListAll(pageData);
//			map.put("result", varList);
//			
//			//托盘满载数
//			String strFullNumber = pd.getString("FullNumber");
//			String strTrayId = pd.getString("TrayId");
//			int numberData = 0;
//			//当前已绑定的零件数量初始化
//			int partSizeByTrayId = 0;
//			if(strTrayId != null && !"".equals(strTrayId)){
//				//根据托盘Id查询已经绑定的零件
//				List<PageData> dataPartList = partInfoService.getPartListByTrayId(pd);
//				if(dataPartList != null){
//					//当前已绑定的零件数量
//					partSizeByTrayId = dataPartList.size();
//				}				
//			}
//			
//			if(strFullNumber != null && !"".equals(strFullNumber) && !"undefined".equals(strFullNumber)){
//				numberData = Integer.parseInt(strFullNumber)-partSizeByTrayId;
//				map.put("FullNumber", numberData);
//			}else{
//				map.put("FullNumber", strFullNumber);
//			}
//			
//			
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}
//		
//		return AppUtil.returnObject(new PageData(), map);
//	}
	
	
	/**
	 * 保存扫码枪的零件信息
	 */
	@RequestMapping(value = "/savePartInfo")
	@ResponseBody
	public Object savePartInfo() {
		Map<String, Object> map = new HashMap<String, Object>();	
		try {
			
			PageData pd = new PageData();
			pd = this.getPageData();

//			Subject currentUser = SecurityUtils.getSubject();
//			Session session = currentUser.getSession();
//			User user = (User) session.getAttribute(Const.SESSION_USER);
			String AP_ID = pd.getString("AP_ID");
			String trayId = pd.getString("TrayId");
			//校验二维码是否重复
			if (partInfoService.findRepeatCount(pd) == null) {
				pd.put("ID", this.get32UUID()); // ID
				pd.put("DR", 0);
				pd.put("CreateTime", DateUtil.getTime());
				pd.put("CreateUser", "admin");
				pd.put("TrayId", "");
				//写入零件表
				partInfoService.save(pd);
				
//				//写日志
//				pd.put("LOGID", this.get32UUID()); // ID
//				pd.put("DR", 0);
//				pd.put("CreateTime", DateUtil.getTime());			
//				pd.put("CreateUser", "admin");			
//				pd.put("TYPE", "零件");
//				pd.put("STATE", "未使用");
//				pd.put("ADDRESS", "下线点");
//				pd.put("INFO", "新增零件名："+pd.getString("PartName")+";二维码："+pd.getString("QRCode"));
//				logInfoService.saveLogInfo(pd);	
				
				map.put("result", "success");
				map.put("TrayId", trayId);
			}else{
				map.put("result", "error");
			}
		
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
//	/**
//	 * 绑定箱子与零件的关系
//	 */
//	@RequestMapping(value = "/saveTrayPartRel")
//	@ResponseBody
//	public Object saveTrayPartRel() {
//		Map<String, Object> map = new HashMap<String, Object>();	
//		try {
//			//获取页面数据
//			PageData pd = new PageData();
//			pd = this.getPageData();
//			Page pageData = new Page();
//			pageData.setPd(pd);
//			
//			//根据托盘ID，获取该托盘中所有可用箱子的信息，并按照时间顺序排序
//			List<Map<String, String>> boxIdList = new ArrayList<Map<String, String>>();
//			List<PageData> varBoxList  = trayPartRelService.findSelectBoxCount(pageData);
//			
//			//获取页面选中的零件信息
//			String[] partDatas = pd.getString("arrayData").split(",");
//			//选中的零件数量
//			int partSize = partDatas.length;
//			//数量标志
//			int sizeFlag = 0;
//			for(int i=0;i<varBoxList.size();i++){
//				//箱子容纳零件总数
//				int boxFullSize = 0;
//				Map<String, String> boxMap = new HashMap<String, String>();
//				boxMap.put("BoxId", varBoxList.get(i).getString("BoxId"));
//				boxMap.put("BoxQRCode", varBoxList.get(i).getString("BoxQRCode"));
//				boxIdList.add(boxMap);
//				//箱子ID
//				String boxId = varBoxList.get(i).getString("BoxId");
//				//箱子二维码
//				String BoxQRCode = varBoxList.get(i).getString("BoxQRCode");
//				//箱子满载数
//				String strFullNumber = varBoxList.get(i).getString("FullNumber");
//				if(strFullNumber!= null && !"".equals(strFullNumber)){
//					boxFullSize = Integer.valueOf(strFullNumber);
//					for(int j=0;j<boxFullSize;j++){
//						pd.put("ID", this.get32UUID()); // ID
//						pd.put("BoxId", boxId);
//						pd.put("BoxQRCode", BoxQRCode);
//						//防止箱子满载数大于选中的零件数
//						if(sizeFlag<=partSize){
//							//零件信息
//							String[] partInfo = partDatas[sizeFlag].split("~");
//							String partId = partInfo[0];
//							String partQRCode = partInfo[1];
//							pd.put("PartId", partId);
//							pd.put("PartQRCode", partQRCode);
//							boxPartRelService.save(pd);
//						}
//						sizeFlag++;
//					}
//				}
//			}
//			map.put("result", "success");
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}
//		
//		return AppUtil.returnObject(new PageData(), map);
//	}
	
	/**
	 * 绑定托盘与零件的关系
	 */
	@RequestMapping(value = "/saveTrayPartRel")
	@ResponseBody
	public Object saveTrayPartRel() {
		Map<String, Object> map = new HashMap<String, Object>();
//		Subject currentUser = SecurityUtils.getSubject();
//		Session session = currentUser.getSession();
//		User user = (User) session.getAttribute(Const.SESSION_USER);
		try {
			//获取页面数据
			PageData pd = new PageData();
			pd = this.getPageData();
			Page pageData = new Page();
			pageData.setPd(pd);
			
			List<PageData> dataPartList = partInfoService.getPartListBangDing(pd);
			
			for(int i=0;i<dataPartList.size();i++){
				PageData pdd = dataPartList.get(i);

				if(pdd.get("Sclass")==null||pdd.get("Sclass").toString().equals("")){
					pdd.put("Sclass", pd.get("Sclass").toString());
				}
				if(dataPartList.size()==Integer.valueOf(pd.get("FullNumber").toString())){
					pdd.put("TrayId", pd.get("TrayId").toString());
				}
				partInfoService.updatePartStateByTrayIdBangDing(pdd);
			}
			
			String Model="";
			String PartNumber="";
			String AddressName="";
			if(dataPartList.size()>0){
				Model=this.getQRData(dataPartList.get(0).getString("QRCode")).getString("Model");
				PartNumber=this.getQRData(dataPartList.get(0).getString("QRCode")).getString("PartNumber");
				AddressName=getAddressShow(pd.getString("Address"));
			}
			
			PageData pdp = new PageData();
			String B_ID=this.get32UUID();
			
			if(pd.getString("Address").indexOf("EP3曲轴")>-1){
				pd.put("Address", "EP3曲轴下线点");
			}
			
			if(pd.getString("Address").indexOf("EP1平衡轴")>-1){
				pd.put("Address", "EP1平衡轴下线点");
			}
			
			String No=String.valueOf(bindingBoxService.getNo(pd).get("No"));
			pdp.put("B_ID", B_ID); // ID
			pdp.put("CreateTime", DateUtil.getTime());
			pdp.put("No", No);
			pdp.put("Address", pd.getString("Address"));
			pdp.put("Sclass", pd.getString("Sclass"));
			pdp.put("Model",Model );
			pdp.put("PartNumber", PartNumber);
			pdp.put("AddressName",AddressName );
			bindingBoxService.save(pdp);
			dataPartList=this.updateQRCode(dataPartList);
			for(int i=0;i<dataPartList.size();i++){
				PageData pdd = new PageData();
				pdd.put("BI_ID", this.get32UUID()); // ID
				pdd.put("B_ID", B_ID); // ID
				pdd.put("QRCode", dataPartList.get(i).getString("QRCode")); // ID
				pdd.put("QRCodeShow", dataPartList.get(i).getString("QRCodeShow")); // ID
				bindingBoxInfoService.save(pdd);
			}
			
			if(dataPartList.size()==Integer.valueOf(pd.get("FullNumber").toString())){
				
				pd.put("State", "满箱");
				pd.put("UpdateTime", DateUtil.getTime());			
				pd.put("UpdateUser", "admin");
				trayInfoService.editTrayState(pd);
			}
//			
//			
//			//托盘容纳零件总数
//			int trayFullNumber = Integer.parseInt(fullNumber);
//			//根据托盘Id查询已经绑定的零件
//			List<PageData> dataPartList = partInfoService.getPartListByTrayId(pd);
//			int partSizeByTrayId = 0;
//			if(dataPartList!=null){
//				//当前已绑定的零件数量
//				partSizeByTrayId = dataPartList.size();
//			}
//			
//			//剩余可绑定的零件数量
//			int numberSize = trayFullNumber - partSizeByTrayId;
//			
//			//获取页面选中的零件信息
//			String[] partDatas = pd.getString("arrayData").split(",");
//			//选中的零件数量
//			int partSize = partDatas.length;
//			if(partSize <= numberSize){
//				//绑定托盘
//				//获取页面数据
//				PageData trayPd = new PageData();
//				trayPd = pd;
//				trayPd.put("State", "满箱");
//				trayPd.put("ROW", pd.get("ROW"));
//				trayPd.put("UpdateTime", DateUtil.getTime());			
//				trayPd.put("UpdateUser", "admin");
//				trayInfoService.editTrayState(trayPd);
//				
//				
//				for(int i = 0 ;i<partDatas.length;i++){
//					//零件信息
//					String[] partInfo = partDatas[i].split("~");
//					String partId = partInfo[0];
//					String partQRCode = partInfo[1];
//					
//					pd.put("PartId", partId);
//					pd.put("State", "未使用");
//					pd.put("PartType",PartType);
//					pd.put("DeleteTime", DateUtil.getTime());
//					pd.put("DeleteUser", "admin");
//					partInfoService.updatePartStateByTrayId(pd);
//					
//				}				
//
//				PageData xianghaoPd = new PageData();
//				xianghaoPd.put("Address", pd.get("partType")); // ID
//				//绑定箱号
//				trayPartRelService.updateXiangHao(xianghaoPd);
//				
//			}
			map.put("result", "success");
			map.put("B_ID", B_ID);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 打印预览页面
	 */
	@RequestMapping(value="/printTable")
	public ModelAndView printTable() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		System.out.println("打印----------------------------------");
		System.out.println(pd.getString("B_ID"));
		
		pd.putAll(bindingBoxService.findById(pd));
		
		//根据托盘ID，获取所有零件信息
		List<PageData> listData = bindingBoxInfoService.getListByBID(pd);
		pd.put("printTime",  DateUtil.getTime());
		mv.setViewName("trayPartRel/info/printTable");
		mv.addObject("pd", pd);
		mv.addObject("listData", listData);
		
		return mv;
	}
	
	/**
	 * 解析二维码-平衡轴
	 * @return
	 * @throws Exception
	 */
//	public PageData getQRDataPHZ(PageData pd) throws Exception{
////        pd.put("PartType", "平衡轴");
//		//获取当前可以使用的零件列表
//		Page pageData = new Page();
//		pageData.setPd(pd);
//		List<PageData> varList  = partInfoService.getPartListAll(pageData);
//		if(varList!=null){
//			for(int i=0;i<varList.size();i++){
//				String strQRCode =  varList.get(i).getString("QRCode");
//				if(strQRCode.length()>=13){
//				pd.put("zubiehao", strQRCode.substring(0, 1));
//				pd.put("fenzu", strQRCode.substring(1, 3));
//				pd.put("chejian", strQRCode.substring(3, 4));
//				pd.put("riqi", strQRCode.substring(4, 6));
//				pd.put("shijian", strQRCode.substring(6, 9));
//				pd.put("tiaoxian", strQRCode.substring(9, 13));
//				break;
//				}
//			}
//		}
//		return pd;
//	}
	
	/**
	 * 解析二维码-缸体
	 * @return
	 * @throws Exception
	 */
//	public PageData getQRDataGT(PageData pd) throws Exception{
//        //pd.put("PartType", "缸体");
//		//获取当前可以使用的零件列表
//		Page pageData = new Page();
//		pageData.setPd(pd);
//		List<PageData> varList  = partInfoService.getPartListAll(pageData);
//		if(varList!=null){
//			for(int i=0;i<varList.size();i++){
//				String strQRCode =  varList.get(i).getString("QRCode");
//				if(strQRCode.length()>=16){
//					pd.put("chejian", strQRCode.substring(0, 3));
//					pd.put("riqi", strQRCode.substring(3, 9));
//					pd.put("shijian", strQRCode.substring(9, 15));
//					pd.put("chanxian", strQRCode.substring(15, 16));
//					break;
//				}
//			}
//		}
//		return pd;
//	}

	/**
	 * 解析二维码-缸盖
	 * @return
	 * @throws Exception
	 */
//	public PageData getQRDataGG(PageData pd) throws Exception{
//        //pd.put("PartType", "缸盖");
//		//获取当前可以使用的零件列表
//		Page pageData = new Page();
//		pageData.setPd(pd);
//		List<PageData> varList  = partInfoService.getPartListAll(pageData);
//		if(varList!=null){
//			for(int i=0;i<varList.size();i++){
//				String strQRCode =  varList.get(i).getString("QRCode");
//				if(strQRCode.length()>=13){
//				pd.put("zubiehao", strQRCode.substring(0, 1));
//				pd.put("fenzu", strQRCode.substring(1, 3));
//				pd.put("chejian", strQRCode.substring(3, 4));
//				pd.put("riqi", strQRCode.substring(4, 6));
//				pd.put("shijian", strQRCode.substring(6, 9));
//				pd.put("tiaoxian", strQRCode.substring(9, 13));
//				break;
//				}
//			}
//		}
//		return pd;
//	}

	/**
	 * 解析二维码-连杆
	 * @return
	 * @throws Exception
	 */
//	public PageData getQRDataLG(PageData pd) throws Exception{
//        //pd.put("PartType", "连杆");
//		//获取当前可以使用的零件列表
//		Page pageData = new Page();
//		pageData.setPd(pd);
//		List<PageData> varList  = partInfoService.getPartListAll(pageData);
//		if(varList!=null){
//			for(int i=0;i<varList.size();i++){
//				String strQRCode =  varList.get(i).getString("QRCode");
//				if(strQRCode.length()>=13){
//				pd.put("zubiehao", strQRCode.substring(0, 1));
//				pd.put("fenzu", strQRCode.substring(1, 3));
//				pd.put("chejian", strQRCode.substring(3, 4));
//				pd.put("riqi", strQRCode.substring(4, 6));
//				pd.put("shijian", strQRCode.substring(6, 9));
//				pd.put("tiaoxian", strQRCode.substring(9, 13));
//				break;
//				}
//			}
//		}
//		return pd;
//	}

	/**
	 * 解析二维码-曲轴
	 * @return
	 * @throws Exception
	 */
//	public PageData getQRDataQZ(PageData pd) throws Exception{
//        //pd.put("PartType", "曲轴");
//		//获取当前可以使用的零件列表
//		Page pageData = new Page();
//		pageData.setPd(pd);
//		List<PageData> varList  = partInfoService.getPartListAll(pageData);
//		if(varList!=null){
//			for(int i=0;i<varList.size();i++){
//				String strQRCode =  varList.get(i).getString("QRCode");
//				if(strQRCode.length()>=15){
//				pd.put("chejian", strQRCode.substring(0, 3));
//				pd.put("riqi", strQRCode.substring(3, 8));
//				pd.put("shijian", strQRCode.substring(8, 14));
//				pd.put("shengchanxian", strQRCode.substring(14, 15));
//				break;
//				}
//			}
//		}
//		return pd;
//	}
	
	/**
	 * 保存扫码枪的零件信息
	 */
	@RequestMapping(value = "/deletePartData")
	@ResponseBody
	public Object deletePartData() {
		Map<String, Object> map = new HashMap<String, Object>();	
		try {
			
			PageData pd = new PageData();
			pd = this.getPageData();
			String id = pd.getString("id");
			pd.put("ID",id); // ID
			//删除数据
			partInfoService.deletePartData(pd);
			map.put("result", "success");		
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		return AppUtil.returnObject(new PageData(), map);
	}
	
	public List<PageData> updateQRCode(List<PageData> list){
		
		
		for(int i=0;i<list.size();i++){
			
			String QRCode=list.get(i).getString("QRCode").toString();
			//缸体
			if(QRCode.indexOf("06H103011AG")>=0||QRCode.indexOf("06H103011AT")>=0||QRCode.indexOf("06K103011CR")>=0||QRCode.indexOf("06K103011CT")>=0){
				QRCode=QRCode.substring(0, 11)+"-"+QRCode.substring(11, 18)+"-"+QRCode.substring(18);
			}
			
			//缸盖
			if(QRCode.indexOf("06J103063B")>=0||QRCode.indexOf("06L103064D")>=0||QRCode.indexOf("06L103064C")>=0||QRCode.indexOf("06L103064M")>=0){
				QRCode=QRCode.substring(0, 3)+"-"+QRCode.substring(3, 9)+"-"+QRCode.substring(9, 15)+"-"+QRCode.substring(15, 16)+"-"+QRCode.substring(16);
			}
			
			//曲轴
			if(QRCode.indexOf("06J105101P")>=0||QRCode.indexOf("06K105101D")>=0||QRCode.indexOf("06K105101G")>=0||QRCode.indexOf("06K105101K")>=0){
				QRCode=QRCode.substring(0, 3)+"-"+QRCode.substring(3, 9)+"-"+QRCode.substring(9, 15)+"-"+QRCode.substring(15, 16)+"-"+QRCode.substring(16);
			}
			if(QRCode.indexOf("06J105101AB")>=0){
				QRCode=QRCode.substring(0, 3)+"-"+QRCode.substring(3, 9)+"-"+QRCode.substring(9, 15)+"-"+QRCode.substring(15, 16)+"-"+QRCode.substring(16, 27)+"-"+QRCode.substring(27);
			}
			
			//连杆
			if(QRCode.indexOf("06L105401G")>=0||QRCode.indexOf("06L105401M")>=0){
				QRCode=QRCode.substring(0, 3)+"-"+QRCode.substring(3, 9)+"-"+QRCode.substring(9, 15)+"-"+QRCode.substring(15, 16)+"-"+QRCode.substring(16);
			}
			
			//平衡轴
			if(QRCode.indexOf("06L103295AC")>=0||QRCode.indexOf("06L103295AB")>=0||QRCode.indexOf("06L103295AP")>=0||QRCode.indexOf("06L103295AR")>=0||QRCode.indexOf("06L103295AS")>=0){
				QRCode=QRCode.substring(0, 6)+"-"+QRCode.substring(6, 12)+"-"+QRCode.substring(12, 18)+"-"+QRCode.substring(18, 19)+"-"+QRCode.substring(19);
			}
			if(QRCode.indexOf("06L103295S")>=0){
				QRCode=QRCode.substring(0, 6)+"-"+QRCode.substring(6, 12)+"-"+QRCode.substring(12, 18)+"-"+QRCode.substring(18, 19)+"-"+QRCode.substring(19);
			}
			
			list.get(i).put("QRCodeShow", QRCode);
		}
		
		return list;
	}
	

	public PageData getQRData(String QRCode) throws Exception{
		PageData pd=new PageData();
		
		//缸体
		if(QRCode.indexOf("06H103011AG")>=0){
			pd.put("Model", "EVO2 1.8T");
			pd.put("PartNumber", "06H103011AG");
		}

		if(QRCode.indexOf("06H103011AT")>=0){
			pd.put("Model", "EVO2 2.0T");
			pd.put("PartNumber", "06H103011AT");
		}

		if(QRCode.indexOf("06K103011CR")>=0){
			pd.put("Model", "GEN3 1.8T");
			pd.put("PartNumber", "06K103011CR");
		}

		if(QRCode.indexOf("06K103011CT")>=0){
			pd.put("Model", "GEN3 2.0T");
			pd.put("PartNumber", "06K103011CT");
		}
		
		

		//缸盖
		if(QRCode.indexOf("06J103063B")>=0){
			pd.put("Model", "EVO2 1.8/2.0T");
			pd.put("PartNumber", "06J103063B");
		}

		if(QRCode.indexOf("06L103064D")>=0){
			pd.put("Model", "GEN3 1.8T");
			pd.put("PartNumber", "06L103064D");
		}

		if(QRCode.indexOf("06L103064C")>=0){
			pd.put("Model", "GEN3 2.0T");
			pd.put("PartNumber", "06L103064C");
		}

		if(QRCode.indexOf("06L103064M")>=0){
			pd.put("Model", "B-Z 2.0T");
			pd.put("PartNumber", "06L103064M");
		}
		
		

		//曲轴
		if(QRCode.indexOf("06J105101P")>=0){
			pd.put("Model", "EVO2 1.8T");
			pd.put("PartNumber", "06J105101P");
		}

		if(QRCode.indexOf("06J105101AB")>=0){
			pd.put("Model", "EVO2 2.0T");
			pd.put("PartNumber", "06J105101AB");
		}

		if(QRCode.indexOf("06K105101D")>=0){
			pd.put("Model", "GEN3 1.8T");
			pd.put("PartNumber", "06K105101D");
		}

		if(QRCode.indexOf("06K105101G")>=0){
			pd.put("Model", "GEN3 2.0T");
			pd.put("PartNumber", "06K105101G");
		}

		if(QRCode.indexOf("06K105101K")>=0){
			pd.put("Model", "B-Z 2.0T");
			pd.put("PartNumber", "06K105101K");
		}
		

		//连杆
		if(QRCode.indexOf("06L105401G")>=0){
			pd.put("Model", "EVO2/GEN3 1.8T");
			pd.put("PartNumber", "06L105401G");
		}

		if(QRCode.indexOf("06L105401M")>=0){
			pd.put("Model", "EVO2/GEN3 2.0T");
			pd.put("PartNumber", "06L105401M");
		}
		
		//平衡轴
		if(QRCode.indexOf("06L103295AC")>=0){
			pd.put("Model", "进气 1.8T");
			pd.put("PartNumber", "06L103295AC");
		}

		if(QRCode.indexOf("06L103295S")>=0){
			pd.put("Model", "排气 1.8T");
			pd.put("PartNumber", "06L103295S");
		}

		if(QRCode.indexOf("06L103295AB")>=0){
			pd.put("Model", "进气 2.0T（蜗牛毛坯）");
			pd.put("PartNumber", "06L103295AB");
		}

		if(QRCode.indexOf("06L103295AP")>=0){
			pd.put("Model", "排气 2.0T（MQB）");
			pd.put("PartNumber", "06L103295AP");
		}
		if(QRCode.indexOf("06L103295AR")>=0){
			pd.put("Model", "排气 2.0T（MLB）");
			pd.put("PartNumber", "06L103295AR");
		}

		if(QRCode.indexOf("06L103295AS")>=0){
			pd.put("Model", "排气 2.0T（BZ）");
			pd.put("PartNumber", "06L103295AS");
		}
		
		return pd;
		
	}
	
	public String getAddressShow(String Address){
		

		if(Address.equals("EP1平衡轴下线点1")){
			return "TFE1P-AGW1";
		}
		if(Address.equals("EP1平衡轴下线点2")){
			return "TFE1P-AGW2";
		}
		if(Address.equals("EP1缸体下线点")){
			return "TFE1P-ZKG";
		}
		if(Address.equals("EP3连杆下线点")){
			return "TFE3P-PL";
		}
		if(Address.equals("EP1连杆下线点")){
			return "TFE1P-PL";
		}
		if(Address.equals("EP3缸盖下线点")){
			return "TFE3P-ZK";
		}
		if(Address.equals("EP3缸体下线点")){
			return "TFE3P-ZKG";
		}
		if(Address.equals("EP1曲轴下线点")){
			return "TFE1P-KW1";
		}
		if(Address.equals("EP3曲轴下线点1")){
			return "TFE3P-KW2";
		}
		if(Address.equals("EP3曲轴下线点2")){
			return "TFE3P-KW3";
		}
		
		return null;
	}
}
