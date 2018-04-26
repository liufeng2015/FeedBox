package com.fh.service.log;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * log处理
 * @author admin
 *
 */
@Service("logInfoService")
public class LogInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("LogInfoMapper.dictlistPage", page);
		
	}
	
	//新增写LOG
	public void saveLogInfo(PageData pd)throws Exception{
		dao.save("LogInfoMapper.saveLogInfo", pd);
	}
}
