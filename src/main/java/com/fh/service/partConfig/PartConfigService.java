package com.fh.service.partConfig;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 
 * @author Administrator
 *
 */
@Service("partConfigService")
public class PartConfigService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("PartConfigMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("PartConfigMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PartConfigMapper.findById", pd);
	}

	/**
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("PartConfigMapper.dictlistPage", page);		
	}
	
	public List<PageData> findAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("PartConfigMapper.findAll", pd);		
	}
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("PartConfigMapper.delete", pd);
		
	}
		
	
	//通过获取数据
	public PageData findByIP(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PartConfigMapper.findByIP", pd);
	}
}
