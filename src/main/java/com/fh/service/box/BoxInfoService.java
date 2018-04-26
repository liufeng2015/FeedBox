package com.fh.service.box;

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
@Service("boxInfoService")
public class BoxInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("BoxInfoMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("BoxInfoMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BoxInfoMapper.findById", pd);
	}

	//查询校验
	public PageData findRepeatCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BoxInfoMapper.findRepeatCount", pd);
	}
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("BoxInfoMapper.dictlistPage", page);
		
	}
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("BoxInfoMapper.delete", pd);
		
	}
		
	
	//通过获取数据
	public PageData findByName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BoxInfoMapper.findByName", pd);
	}
	
	//编辑物料箱的位置状态
	public void updateBoxState(PageData pd)throws Exception{
		dao.update("BoxInfoMapper.updateBoxState", pd);
	}
}
