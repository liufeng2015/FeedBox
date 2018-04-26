package com.fh.service.tray;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("trayInfoService")
public class TrayInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("TrayInfoMapper.save", pd);
	}
		
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("TrayInfoMapper.edit", pd);
	}
	
	/**
	 * 修改托盘状态
	 * @param pd
	 * @throws Exception
	 */
	public void editTrayState(PageData pd)throws Exception{
		dao.update("TrayInfoMapper.editTrayState", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TrayInfoMapper.findById", pd);
	}

	//查询校验
	public PageData findRepeatCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TrayInfoMapper.findRepeatCount", pd);
	}
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TrayInfoMapper.dictlistPage", page);
		
	}
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("TrayInfoMapper.delete", pd);
		
	}
	
	//编辑托盘车的状态和位置状态
	public void updateTrayState(PageData pd)throws Exception{
		dao.update("TrayInfoMapper.updateTrayState", pd);
	}
	
	//通过获取数据
	public PageData findByName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TrayInfoMapper.findByName", pd);
	}
}
