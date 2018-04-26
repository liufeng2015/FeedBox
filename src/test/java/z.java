import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

public class z {

	public static void main(String[] args) throws UnknownHostException, IOException {
		// TODO Auto-generated method stub

		Socket socket=new Socket("192.168.0.178",4001);
		BufferedReader br = getReader(socket);
		PrintWriter pw = getWriter(socket);
		String localhost = InetAddress.getLocalHost().getHostName();//获取主机名字
		//sendAndReceive();
		byte[] s=socketWriter.hexStringToBytes("A0 03 01 79 E3");
		pw.println(s);
		String re="";
		re=br.readLine();
		System.out.println(re);
	}
	
	private static PrintWriter getWriter(Socket socket)throws IOException{
		OutputStream socketOut = socket.getOutputStream();
		return new PrintWriter(socketOut,true);
	}
	
	private static BufferedReader getReader(Socket socket)throws IOException{
		InputStream socketIn = socket.getInputStream();
		return new BufferedReader(new InputStreamReader(socketIn));
	}
	
	private void sendAndReceive(String str,BufferedReader br,PrintWriter pw)throws IOException{
		if(str!=null){
			System.out.println("Client>"+str);
			pw.println(str);
		}
		String response;
		if((response = br.readLine())!=null){
			System.out.println("Server>"+response);
		}
	}

}
