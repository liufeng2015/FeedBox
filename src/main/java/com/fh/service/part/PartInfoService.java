package com.fh.service.part;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("partInfoService")
public class PartInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("PartInfoMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("PartInfoMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PartInfoMapper.findById", pd);
	}
	
	public PageData findByQRCode(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PartInfoMapper.findByQRCode", pd);
	}
	

	//查询校验
	public PageData findRepeatCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PartInfoMapper.findRepeatCount", pd);
	}
	
	/**
	 * 根据托盘id查询已绑定的零件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getPartListByTrayId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("PartInfoMapper.getPartListByTrayId", pd);
	}
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("PartInfoMapper.dictlistPage", page);
		
	}
	//列出所有可用的零件数据
	public List<PageData> getPartListAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("PartInfoMapper.getPartListAll", pd);
		
	}
	public PageData getPartListAllC(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PartInfoMapper.getPartListAllC", pd);
		
	}
	
	
	public List<PageData> getPartListBangDing(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("PartInfoMapper.getPartListBangDing", pd);
		
	}
	
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("PartInfoMapper.delete", pd);
		
	}
	public void deletePartData(PageData pd) throws Exception {
		dao.delete("PartInfoMapper.deletePartData", pd);
		
	}
	
	
	
	//通过获取数据
	public PageData findByName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PartInfoMapper.findByName", pd);
	}
	
	/**
	 * 变更选中箱子ID下所有的零件状态为已使用
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatePartStateByPartId(PageData pd) throws Exception {
		dao.save("PartInfoMapper.updatePartStateByPartId", pd);
	}
	
	public void updatePartStateByTrayIdBangDing(PageData pd) throws Exception {
		dao.save("PartInfoMapper.updatePartStateByTrayIdBangDing", pd);
	}
	
	
	/**
	 * 变更选中托盘ID下所有的零件状态为已使用
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatePartStateByTrayId(PageData pd) throws Exception {
		dao.save("PartInfoMapper.updatePartStateByTrayId", pd);
	}
}
