package com.fh.service.tongji;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("tongJiInfoService")
public class TongJiInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 查询统计
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTrayList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TongJiInfoMapper.getTrayList", page);
		
	}
	
	/**
	 * 统计数量
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getStateCountList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TongJiInfoMapper.getStateCountList", page);		
	}
	
	/**
	 * 统计表2数量
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTrayTypeCountList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TongJiInfoMapper.getTrayTypeCountList", page);		
	}
	
	public List<PageData> getPartState(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TongJiInfoMapper.getPartState", page);		
	}

	public List<PageData> getPartTJ(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TongJiInfoMapper.getPartTJ", page);		
	}
	

	public List<PageData> getPartSX(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TongJiInfoMapper.getPartSX", page);		
	}

	public List<PageData> getPartXX(Page page) throws Exception {
		return (List<PageData>) dao.findForList("TongJiInfoMapper.getPartXX", page);		
	}
	
	public PageData getPartXXGT(Page page) throws Exception {
		return (PageData)dao.findForObject("TongJiInfoMapper.getPartXXGT", page);		
	}
	public PageData getPartXXGG(Page page) throws Exception {
		return (PageData) dao.findForObject("TongJiInfoMapper.getPartXXGG", page);		
	}
	public PageData getPartXXPHZ(Page page) throws Exception {
		return (PageData) dao.findForObject("TongJiInfoMapper.getPartXXPHZ", page);		
	}
	public PageData getPartXXLG(Page page) throws Exception {
		return (PageData) dao.findForObject("TongJiInfoMapper.getPartXXLG", page);		
	}
	public PageData getPartXXQZ(Page page) throws Exception {
		return (PageData) dao.findForObject("TongJiInfoMapper.getPartXXQZ", page);		
	}
	

	public PageData getDayTJ(Page page) throws Exception {
		return (PageData) dao.findForObject("TongJiInfoMapper.getDayTJ", page);		
	}
	
	public PageData getDayTJQZ(Page page) throws Exception {
		return (PageData) dao.findForObject("TongJiInfoMapper.getDayTJQZ", page);		
	}
	
	
}
