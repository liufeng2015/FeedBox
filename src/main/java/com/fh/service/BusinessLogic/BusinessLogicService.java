package com.fh.service.BusinessLogic;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.util.PageData;

@Service("businessLogicService")
public class BusinessLogicService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("BusinessLogicMapper.save", pd);
	}
	
	/**
	 * 全部数据
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllEidData(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("BusinessLogicMapper.listAllEidData", pd);
	}
	
	/**
	 * 删除数据
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void delBusinessByEid(PageData pd)throws Exception{
		dao.delete("BusinessLogicMapper.delete", pd);
	}
	
}
