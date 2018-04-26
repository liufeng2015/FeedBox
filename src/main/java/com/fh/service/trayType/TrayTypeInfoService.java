package com.fh.service.trayType;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("trayTypeInfoService")
public class TrayTypeInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 查询统计
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getTrayList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TrayTypeManageMapper.getTrayTypeList", page);		
	}
		
	public void save(PageData pd)throws Exception{
		dao.save("TrayTypeManageMapper.save", pd);
	}
	
	public void edit(PageData pd)throws Exception{
		dao.update("TrayTypeManageMapper.edit", pd);
	}
	
	public void delete(PageData pd)throws Exception{
		dao.update("TrayTypeManageMapper.delete", pd);
	}
}
