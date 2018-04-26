package com.fh.plugin;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Random;

public class SocketRead {

	public static void main(String[] args) throws IOException {
		StringBuffer str = new StringBuffer();

		str.append("A0");
		str.append("04");
		str.append("01");
		str.append("89");
		str.append("01");
		str.append("D1");
		//sendMessage(String.valueOf(str));
		// //1、创建客户端Socket，指定服务器地址和端口
		// Socket socket =new Socket("192.168.0.178",4001);
		// //2、获取输出流，向服务器端发送信息
		// OutputStream os = socket.getOutputStream();//字节输出流
		// PrintWriter pw =new PrintWriter(os);//将输出流包装成打印流
		//
		// pw.write(socketWriter.hexStringToBytes("A0 03 01 79 E3").toString());
		// pw.flush();
		// socket.shutdownOutput();
		// //3、获取输入流，并读取服务器端的响应信息
		// InputStream is = socket.getInputStream();
		// BufferedReader br = new BufferedReader(new InputStreamReader(is));
		// String info = null;
		// while((info=br.readLine())!=null){
		// System.out.println("我是客户端，服务器说："+info);
		// }

	}
	
	public static String excuteXdrByMsi(int length)
    {
        StringBuffer buffer = new StringBuffer("0123456789");
        StringBuffer sb = new StringBuffer();
        Random r = new Random();
        int range = buffer.length();
        for (int i = 0; i < length; i ++)
        {
            sb.append(buffer.charAt(r.nextInt(range)));
        }
        return sb.toString();
    }

	public static String sendMessage(String message,String ip,int port) throws UnknownHostException, IOException {
		String result = null;
		Socket socket = new Socket(ip, port);
		try {
			//Socket socket = new Socket("192.168.0.178", 4001);
			
			OutputStream outputStream = socket.getOutputStream();
			outputStream.write(hexStringToBytes(message));
			outputStream.flush();
			BufferedInputStream in = new BufferedInputStream(socket.getInputStream());
			byte[] b = new byte[1024];
			in.read(b);
//			System.out.println(ip+":"+port+"-------------------------------准备获取返回结果-------------------------------------");  
			result = bytesToHexString(b);
//			System.out.println(result); 
			socket.close();
			//System.out.println(ip+":"+port+"-------------------------------返回结果读取结束，socket关闭-------------------------------------");  
		} catch (Exception e) {
			socket.close();
			e.printStackTrace();
		}
		return result;
	}

	public static byte[] hexStringToBytes(String hexString) {
		if ((hexString == null) || (hexString.equals(""))) {
			return null;
		}
		hexString = hexString.toUpperCase();
		int length = hexString.length() / 2;
		char[] hexChars = hexString.toCharArray();
		byte[] d = new byte[length];
		for (int i = 0; i < length; i++) {
			int pos = i * 2;
			d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[(pos + 1)]));
		}
		return d;
	}

	private static byte charToByte(char c) {
		return (byte) "0123456789ABCDEF".indexOf(c);
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
}
