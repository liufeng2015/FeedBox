import java.io.InputStream;
import java.net.InetSocketAddress;
import java.net.*;
import java.net.SocketAddress;
import java.util.Arrays;

import junit.framework.Assert;


public class CardFlow {
	ClientLaunch cl = new ClientLaunch();
	socketWriter socketWriter = new socketWriter();
	InputStream socketReader;
  
	
	
  public void cardFlow() throws Exception {
		// 建立 socket链接，连接服务器192.168.1.1:8080
	    Socket socket = new Socket("192.168.0.178",4001);
		
		
		String charger="A0 03 01 79 E3";
		//登陆，通过验证输出报文中的响应报文是否为 "000000"，判断是否登陆成功，其中loginInput为输出报文字符串
		String outlogin = cl.Client(socket, socketWriter, socketReader, charger);

		System.out.println(outlogin);
		
		socket.close();
  }
  
  public static void main(String[] args) throws Exception {
		// 127.0.0.1 代表本机地址，在 8888 端口上监听
	  CardFlow sender = new CardFlow();
	  sender.cardFlow();
	}
}