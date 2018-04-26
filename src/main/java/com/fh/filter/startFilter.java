package com.fh.filter;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.java_websocket.WebSocketImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fh.plugin.SocketServer;
import com.fh.plugin.websocketInstantMsg.ChatServer;
import com.fh.plugin.websocketOnline.OnlineChatServer;
import com.fh.service.partConfig.PartConfigService;
import com.fh.service.system.dictionaries.DictionariesService;
import com.fh.util.Const;
import com.fh.util.DataConstants;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;

/**
 * 创建人：FH 
 * 创建时间：2014年2月17日
 * @version
 */
public class startFilter extends BaseController implements Filter{

	
	
	
	/**
	 * 初始化
	 */
	public void init(FilterConfig fc) throws ServletException {
		this.startWebsocketInstantMsg();
		this.startWebsocketOnline();
		try {
			this.setupDictionary(fc.getServletContext());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 启动即时聊天服务
	 */
	public void startWebsocketInstantMsg(){
		WebSocketImpl.DEBUG = false;
		ChatServer s;
		try {
			String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);//读取WEBSOCKET配置,获取端口配置
			if(null != strWEBSOCKET && !"".equals(strWEBSOCKET)){
				String strIW[] = strWEBSOCKET.split(",fh,");
				if(strIW.length == 4){
					s = new ChatServer(Integer.parseInt(strIW[1]));
					s.start();
				}
			}
			//System.out.println( "websocket服务器启动,端口" + s.getPort() );
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 启动在线管理服务
	 */
	public void startWebsocketOnline(){
		WebSocketImpl.DEBUG = false;
		OnlineChatServer s;
		try {
			String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);//读取WEBSOCKET配置,获取端口配置
			if(null != strWEBSOCKET && !"".equals(strWEBSOCKET)){
				String strIW[] = strWEBSOCKET.split(",fh,");
				if(strIW.length == 4){
					s = new OnlineChatServer(Integer.parseInt(strIW[3]));
					s.start();
				}
			}
			//System.out.println( "websocket服务器启动,端口" + s.getPort() );
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}
	

    public void setupDictionary(ServletContext context) throws Exception {
    	DataConstants.dataMap = null;
    	ApplicationContext ctx = 
    			WebApplicationContextUtils.getWebApplicationContext(context);

    	DictionariesService dictionariesService = (DictionariesService)ctx.getBean("dictionariesService");
    	
    	Page page=new Page();
    	PageData pd=new PageData();
    	pd.put("PARENT_ID", "0");
    	page.setPd(pd);
    	List<PageData> varList = dictionariesService.findAll(page);
    	
    	DataConstants.dataMap = new HashMap<String, Map<String,String>>();
    	
    	for (PageData ppd : varList) {
    		pd.remove("PARENT_ID");
    		pd.put("PARENT_ID", ppd.getString("ZD_ID"));
    		page.setPd(pd);
    		
    		
    		List<PageData> dis = dictionariesService.findAll(page);
    		
    		Map<String, String> disMap = new LinkedHashMap<String, String>();
    		for (PageData di : dis) {
    			disMap.put(di.getString("BIANMA"), di.getString("NAME"));
    		}
    		
    		DataConstants.dataMap.put(ppd.getString("BIANMA"), disMap);
    	}
    	

		 
    	System.out.println("数据字典加载完毕。。。。");
    	
    	PartConfigService partConfigService = (PartConfigService)ctx.getBean("partConfigService");
    	List<PageData> partConfigList=(List<PageData>) partConfigService.findAll(pd);
    	for (PageData ppd : partConfigList){
        	SocketServer socketServer=new SocketServer(context,Integer.valueOf(ppd.getString("Port")));
    	
        	Thread t=new Thread(socketServer,ppd.getString("IP"));
        	t.start();
    	}
    	
    	
    	System.out.println("socket服务启动。。。。");
    }
	
	
	//计时器
	public void timer() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 9); // 控制时
		calendar.set(Calendar.MINUTE, 0); 		// 控制分
		calendar.set(Calendar.SECOND, 0); 		// 控制秒

		Date time = calendar.getTime(); 		// 得出执行任务的时间

		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				
				//PersonService personService = (PersonService)ApplicationContext.getBean("personService");

				
				//System.out.println("-------设定要指定任务--------");
			}
		}, time, 1000*60*60*24);// 这里设定将延时每天固定执行
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}


	
	
}
