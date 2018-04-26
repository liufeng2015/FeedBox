package com.fh.service.communication;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("communicationService")
public class CommunicationService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("CommunicationMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("CommunicationMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CommunicationMapper.findById", pd);
	}
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("CommunicationMapper.dictlistPage", page);
		
	}
	public List<PageData> findByEId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("CommunicationMapper.findByEId", pd);
		
	}
	
	
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("CommunicationMapper.delete", pd);
		
	}
		
	
	
}
