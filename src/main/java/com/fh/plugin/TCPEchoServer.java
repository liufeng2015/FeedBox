package com.fh.plugin;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketTimeoutException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TCPEchoServer {

	// Size of receive buffer
	private static final int BUFSIZE = 32;

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		ServerSocket serverSocket = null;

		try {

			serverSocket = new ServerSocket(9876);

			System.out.println(getTime() + "服务端准备好啦.");

		} catch (IOException e) {
			// info Auto-generated catch block
			e.printStackTrace();

		}
		while (true) {
			try {
				System.out.println(getTime() + "等待连接请求.");

				// serverSocket.setSoTimeout(5*1000);
				Socket socket = serverSocket.accept();
				System.out.println(getTime() + socket.getInetAddress() + "连接请求从这开始.");
				OutputStream out = socket.getOutputStream();
				BufferedInputStream in=new BufferedInputStream(socket.getInputStream());
				
				//BufferedReader in;
				//in= new BufferedReader(new InputStreamReader(socket.getInputStream(), "GB2312"));
				byte[] b = new byte[1024];
				in.read(b);
				String result = hex2String(bytesToHexString(b));
				if(!result.trim().equals("")){
					System.out.println(socket.getInetAddress().toString().substring(1) +":     "+result.substring(1));
				}
				socket.close();
			} catch (SocketTimeoutException e) {
				//
				System.out.println("end!");
				System.exit(0);

			} catch (IOException e) {

				// info Auto-generated catch block

				e.printStackTrace();

			}

		}

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
