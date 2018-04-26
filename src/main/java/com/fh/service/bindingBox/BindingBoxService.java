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
@Service("bindingBoxService")
public class BindingBoxService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("BindingBoxMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("BindingBoxMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BindingBoxMapper.findById", pd);
	}


	public PageData getNo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BindingBoxMapper.getNo", pd);
	}
	
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("BindingBoxMapper.dictlistPage", page);
		
	}
	
}
