package com.fh.service.bindingBox;

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
@Service("bindingBoxInfoService")
public class BindingBoxInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("BindingBoxInfoMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("BindingBoxInfoMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BindingBoxInfoMapper.findById", pd);
	}

	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("BindingBoxInfoMapper.dictlistPage", page);
		
	}
	public List<PageData> getListByBID(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("BindingBoxInfoMapper.getListByBID", pd);
		
	}
	
	
}
