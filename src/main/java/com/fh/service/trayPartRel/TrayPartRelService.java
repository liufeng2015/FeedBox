package com.fh.service.trayPartRel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("trayPartRelService")
public class TrayPartRelService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 列表：查询当前位置的托盘列表
	public List<PageData> getTrayListPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TrayPartRelInfoMapper.getTrayListPage", page);

	}
	// 查询选中托盘的箱子条数，及每个箱子满箱数量
	public List<PageData> findSelectBoxCount(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TrayPartRelInfoMapper.findSelectBoxCount", page);

	}
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TrayPartRelInfoMapper.listAll", pd);
	}
	
	//选中
	public void save(PageData pd)throws Exception{
		dao.save("TrayPartRelInfoMapper.save", pd);
	}
	
	//取消选中
	public void delete(PageData pd)throws Exception{
		dao.save("TrayPartRelInfoMapper.delete", pd);
	}
	
	//更新箱号数量
	public void updateXiangHao(PageData pd)throws Exception{
		dao.save("TrayPartRelInfoMapper.updateXiangHao", pd);
	}
	
	/*
	*获取箱号
	*/
	public List<PageData> getXiangHaoNum(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TrayPartRelInfoMapper.getXiangHaoNum", pd);
	}
}
