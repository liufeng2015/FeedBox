package com.fh.plugin;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fh.entity.Page;
import com.fh.service.BusinessLogic.BusinessLogicService;
import com.fh.service.PositionConfig.PositionConfigService;
import com.fh.service.box.BoxInfoService;
import com.fh.service.boxPartRel.BoxPartRelService;
import com.fh.service.log.LogInfoService;
import com.fh.service.part.PartInfoService;
import com.fh.service.partConfig.PartConfigService;
import com.fh.service.system.dictionaries.DictionariesService;
import com.fh.service.tray.TrayInfoService;
import com.fh.service.trayPartRel.TrayPartRelService;
import com.fh.util.DateUtil;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

public class SocketServer implements Runnable{
	protected Logger logger = Logger.getLogger(this.getClass());

	private TrayInfoService trayInfoService;
	private PartInfoService partInfoService;
	private PartConfigService partConfigService;
	private int port;
	
	public SocketServer(ServletContext context,int port) {
		// TODO Auto-generated constructor stub
		this.port=port;
		ApplicationContext ctx = 
    			WebApplicationContextUtils.getWebApplicationContext(context);
		trayInfoService = (TrayInfoService)ctx.getBean("trayInfoService");
		partConfigService = (PartConfigService)ctx.getBean("partConfigService");
		partInfoService = (PartInfoService)ctx.getBean("partInfoService");
	}
	public void run() {
		System.out.println(Thread.currentThread().getName() + " 线程创建 ;监控端口"+port);
		try {
			show();
			Thread.sleep(50000);
		} catch (InterruptedException ex) {
			ex.printStackTrace(System.err);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @throws Exception
	 */
	public void show() throws Exception{  

	
		ServerSocket serverSocket = null;

		try {

			serverSocket = new ServerSocket(port);

			System.out.println(getTime() + "服务端准备好啦.");

		} catch (IOException e) {
			// info Auto-generated catch block
			e.printStackTrace();

		}
		while (true) {
			
			Socket socket =serverSocket.accept();
			try {
				System.out.println(getTime() + "等待连接请求.");
				
				
				
				// serverSocket.setSoTimeout(5*1000);
				//Socket socket = serverSocket.accept();
				System.out.println(getTime() + socket.getInetAddress() + "连接请求从这开始.");
				OutputStream out = socket.getOutputStream();
				BufferedInputStream in=new BufferedInputStream(socket.getInputStream());
				
				//BufferedReader in;
				//in= new BufferedReader(new InputStreamReader(socket.getInputStream(), "GB2312"));
				byte[] b = new byte[1024];
				in.read(b);
				String result = hex2String(bytesToHexString(b));
				if(!result.trim().equals("")){
					System.out.println(socket.getInetAddress().toString().substring(1) +String.valueOf(port)+":     "+result.trim());
					PageData pd = new PageData();
					logger.debug(socket.getInetAddress().toString().substring(1) +String.valueOf(port)+":     "+result.trim());
					
					pd.put("IP", socket.getInetAddress().toString().substring(1));
					pd.put("Port", port);
					pd=partConfigService.findByIP(pd);
					String address=pd.getString("Address");

					

					int len=(Integer)pd.get("Len");
					int sChar=0;
					int eChar=0+len;
					
					
					
					
					String allCode=result.trim();
					
					allCode=allCode.replace(" ", "");
					allCode=allCode.replace(" ", "");
					int r=allCode.length()/len;
					System.out.println(allCode.length());
					
					
					for(int i=0;i<=r;i++){
						PageData pdp=new PageData();
						if(i==r){
							pdp.put("QRCode", allCode.substring(sChar));
							
							System.out.println(allCode.substring(sChar));
						}else{
							pdp.put("QRCode", allCode.substring(sChar,eChar));
							System.out.println(allCode.substring(sChar, eChar));
						}
						sChar=sChar+len;
						eChar=eChar+len;
						System.out.println(pdp.getString("QRCode").trim().length());
						String QRCode=pdp.getString("QRCode").trim();
						if(pdp.getString("QRCode").trim().length()==len){
							pdp=partInfoService.findByQRCode(pdp);
						}else{
							continue;
						}
						
						String TrayId="";
						if(pdp!=null &&pdp.getString("ID")!=null){
							
							TrayId=pdp.getString("TrayId");
							if(pd.getString("Address").indexOf("下线点")>0){
								pdp.put("State", "未使用");
							}else{
								pdp.put("State", "已使用");
								pdp.put("UseAddress", address);
								pdp.put("UseTime", DateUtil.getTime());
							}
							
							
							partInfoService.edit(pdp);
							
							pd.put("TrayId", TrayId);
							if(partInfoService.getPartListByTrayId(pd).size()==0){
	
								pd.put("State", "空箱");
								pd.put("UpdateTime", DateUtil.getTime());
								pd.put("UpdateUser", "system");
								pd.put("ID", TrayId);
									
								
								trayInfoService.updateTrayState(pd);
								
								
							}
						}else{
							PageData ppp = new PageData();
							if(pd.getString("Address").indexOf("下线点")>0){
								ppp.put("State", "未使用");
								ppp.put("CreateTime", DateUtil.getTime());
							}else{
								ppp.put("State", "已使用");
								ppp.put("UseAddress", address);
								ppp.put("UseTime", DateUtil.getTime());
							}
							ppp.put("ID", this.get32UUID()); // ID
							ppp.put("DR", 0);
							
							ppp.put("CreateUser", "system");
							ppp.put("Address", pd.getString("Address"));
							ppp.put("QRCode", QRCode);
							ppp.put("PartName", pd.getString("TrayType"));
							ppp.put("PartType", pd.getString("TrayType"));
							ppp.put("TrayId", "");
							ppp.put("EP", pd.getString("EP"));
							
							partInfoService.save(ppp);
						}
					}
				}
				socket.close();
			} catch (SocketTimeoutException e) {
				//
				socket.close();
				System.out.println("end!");
				System.exit(0);

			} catch (IOException e) {

				// info Auto-generated catch block
				socket.close();
				e.printStackTrace();

			}

		}

	}

	
	public String get32UUID(){
		
		return UuidUtil.get32UUID();
	}
	static String getTime() {
		// info Auto-generated method stub
		SimpleDateFormat f = new SimpleDateFormat("[hh:mm:s]");
		return f.format(new Date());
	}
	public static final String bytesToHexString(byte[] bArray) {
		StringBuffer sb = new StringBuffer(bArray.length);
		String sTemp;
		for (int i = 0; i < bArray.length; i++) {
			sTemp = Integer.toHexString(0xFF & bArray[i]);
			if (sTemp.length() < 2)
				sb.append(0);
			sb.append(sTemp.toUpperCase());
		}
		return sb.toString();
	}
	public static byte[] string2Bytes(String s){
		
		byte[] r=s.getBytes();
		return r;
		
	}
	
	public static String hex2String(String hex)throws Exception{
		String r=bytes2String(hexString2Bytes(hex));
		return r;
	}
	
	public static byte[] hexString2Bytes(String hex){
		
		if((hex==null)||(hex.equals(""))){
			return null;
		}else if(hex.length()%2!=0){
			return null;
		}else{
			hex=hex.toUpperCase();
			int len=hex.length()/2;
			byte[] b=new byte[len];
			char[] hc=hex.toCharArray();
			for(int i=0;i<len;i++){
				int p=2*i;
				b[i]=(byte)(charToByte(hc[p])<<4|charToByte(hc[p+1]));
			}
			return b;	
			
		}
		
	}
	
	public static byte charToByte(char c){
		return (byte)"0123456789ABCDEF".indexOf(c);
	}
	
	public static String bytes2String(byte[] b)throws Exception{
		
		String r=new String(b,"UTF-8");
		return r;
	}
	
	

}
