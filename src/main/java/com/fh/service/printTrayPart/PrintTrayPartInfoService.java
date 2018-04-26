package com.fh.service.printTrayPart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("printTrayPartInfoService")
public class PrintTrayPartInfoService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("PrintTrayPartInfoMapper.dictlistPage", page);
		
	}
	
}
