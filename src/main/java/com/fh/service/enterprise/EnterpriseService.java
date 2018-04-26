package com.fh.service.enterprise;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("enterpriseService")
public class EnterpriseService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("EnterpriseMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("EnterpriseMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EnterpriseMapper.findById", pd);
	}
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.dictlistPage", page);
		
	}
	
	public List<PageData> getIdAndName() throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.getIdAndName",null);
		
	}
	
	public List<PageData> dictlistPageByIdAndName(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.dictlistPageByIdAndName", page);
		
	}
	public List<PageData> dictlistPageByEnterpriseTax(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.dictlistPageByEnterpriseTax", page);
		
	}
	public List<PageData> dictlistPageByEnterpriseOutputValue(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnterpriseMapper.dictlistPageByEnterpriseOutputValue", page);
		
	}
	
	
	
	
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("EnterpriseMapper.delete", pd);
		
	}
		
	
	
}
