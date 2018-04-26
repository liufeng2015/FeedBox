package com.fh.service.boxPartRel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("boxPartRelService")
public class BoxPartRelService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 列表1：查询已选中的物料箱列表
	public List<PageData> dictChooselistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("BoxPartRelInfoMapper.dictChooselistPage", page);

	}
	
	// 列表2:查询未选中的物料箱列表
	public List<PageData> dictNoChooselistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("BoxPartRelInfoMapper.dictNoChooselistPage", page);

	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BoxPartRelInfoMapper.listAll", pd);
	}
	
	//选中
	public void save(PageData pd)throws Exception{
		dao.save("BoxPartRelInfoMapper.save", pd);
	}
	
	//取消选中
	public void delete(PageData pd)throws Exception{
		dao.delete("BoxPartRelInfoMapper.delete", pd);
	}
}
