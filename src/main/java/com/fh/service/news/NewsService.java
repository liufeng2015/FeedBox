package com.fh.service.news;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("newsService")
public class NewsService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("NewsMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("NewsMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("NewsMapper.findById", pd);
	}
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("NewsMapper.dictlistPage", page);
		
	}
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("NewsMapper.delete", pd);
		
	}
		
	//推送
	public void push(PageData pd) throws Exception {
		dao.delete("NewsMapper.push", pd);
		
	}
		
	
}
