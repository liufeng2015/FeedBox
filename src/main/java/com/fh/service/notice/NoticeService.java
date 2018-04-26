package com.fh.service.notice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("noticeService")
public class NoticeService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("NoticeMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("NoticeMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("NoticeMapper.findById", pd);
	}
	
	//查询总数
	public PageData findCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("NoticeMapper.findCount", pd);
	}
	
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("NoticeMapper.dictlistPage", page);
		
	}
	
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.update("NoticeMapper.delete", pd);
		
	}
	
	//删除文件
		public void delFile(PageData pd) throws Exception {
			dao.update("NoticeMapper.delFile", pd);
			
		}
   //彻底删除
	public void thoroughDelete(PageData pd) throws Exception {
		dao.delete("NoticeMapper.thoroughDelete", pd);
	}
	
}
