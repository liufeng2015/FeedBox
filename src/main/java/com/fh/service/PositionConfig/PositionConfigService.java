package com.fh.service.PositionConfig;

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
@Service("positionConfigService")
public class PositionConfigService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("PositionConfigMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("PositionConfigMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PositionConfigMapper.findById", pd);
	}

	/**
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("PositionConfigMapper.dictlistPage", page);		
	}
	
	/**
	 * 获取配置表的所有信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAllList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("PositionConfigMapper.getAllList", page);		
	}
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("PositionConfigMapper.delete", pd);
		
	}
		
	
	//通过获取数据
	public PageData findByName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PositionConfigMapper.findByName", pd);
	}
}
