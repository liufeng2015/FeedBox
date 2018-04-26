package com.fh.service.accounts;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("AccountsService")
public class AccountsService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("AccountsMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("AccountsMapper.edit", pd);
	}
	
	
	//查询总数
	public PageData findCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AccountsMapper.findCount", pd);
	}
	

	//查询校验
	public PageData findRepeatCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AccountsMapper.findRepeatCount", pd);
	}

	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("AccountsMapper.delete", pd);
		
	}

	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("AccountsMapper.dictlistPage", page);
		
	}
	
	//通过id获取数据
		public PageData findById(PageData pd) throws Exception {
			return (PageData) dao.findForObject("AccountsMapper.findById", pd);
		}
}
