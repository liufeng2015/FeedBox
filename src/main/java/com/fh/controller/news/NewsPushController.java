package com.fh.controller.news;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.communication.CommunicationService;
import com.fh.service.enterprise.EnterpriseService;
import com.fh.service.news.NewsPushService;
import com.fh.service.news.NewsService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
/** 
 * 类名称：DictionariesController
 * 创建人：FH
 * 创建时间：2014年9月2日
 * @version
 */
@Controller
@RequestMapping(value="/newsPush")
public class NewsPushController extends BaseController {


	@Resource(name="newsService")
	private NewsService newsService;
	

	@Resource(name="newsPushService")
	private NewsPushService newsPushService;
	

	@Resource(name="communicationService")
	private CommunicationService communicationService;
	

	@Resource(name="enterpriseService")
	private EnterpriseService enterpriseService;
	/**
	 * 列表
	 */
	@RequestMapping
	public ModelAndView list(Page page)throws Exception{

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);				
		List<PageData> varList = newsPushService.dictlistPage(page);
		mv.setViewName("news/newsPush");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value="/toNewsPush")
	public ModelAndView toNewsPush(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("news/setNewsPush");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{

		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		
		String E_ID = pd.getString("E_ID");
		
		List<PageData> list=communicationService.findByEId(pd);

		pd.put("IsRead",  0);
		pd.put("CreateTime", DateUtil.getTime());
		pd.put("CreateUser",  user.getUSERNAME());
		
		for(int i=0;i<list.size();i++){
			pd.put("C_ID", list.get(i).getString("C_ID"));
			pd.put("NP_ID", this.get32UUID());	//ID
			newsPushService.save(pd);
		}
	

		Map<String,String> map = new HashMap<String,String>();
		map.put("result", "sucess");
		return AppUtil.returnObject(new PageData(), map);
		
		
	}

	
	
	
	
	/**
	 * 删除用户
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String errInfo = "";
		try{
			pd = this.getPageData();
			newsPushService.delete(pd);
			errInfo = "success";
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
		
	}
	

}
