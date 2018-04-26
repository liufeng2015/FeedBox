package com.fh.util.spider;

	import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
	import java.io.FileWriter;
	import java.io.IOException;
	import java.io.InputStream;
	import java.io.InputStreamReader;
	import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
	import java.net.URL;
	import java.net.URLConnection;

	import java.io.BufferedReader;
	import java.io.FileOutputStream;
	import java.io.IOException;
	import java.io.InputStream;
	import java.io.InputStreamReader;
	import java.io.OutputStreamWriter;

	import org.apache.http.HttpEntity;
	import org.apache.http.HttpResponse;
	import org.apache.http.client.*;
	import org.apache.http.client.methods.HttpGet;
	import org.apache.http.impl.client.DefaultHttpClient;

	public class SpiderHttpClient {

		public static void main(String[] args) {
			String dre="http://weibo.com/2620648747/F86Bi4q4W?type=comment#_rnd1497936881936";//一个网址，这里就不贴出来了；
			String filep="e:/URL.html";

			try{
				URL url=new URL(dre);
				InputStream in=url.openStream();
				InputStreamReader isr=new InputStreamReader(in);
				BufferedReader br=new BufferedReader(isr);
				BufferedWriter bw=new BufferedWriter(new FileWriter(filep));
				PrintWriter pw=new PrintWriter(bw);
				String temps=null;
			while((temps=br.readLine())!=null){
				pw.print(temps);
			}
				System.out.println("网页"+dre+"的内容保存完成，"+ "保存在"+filep+"文件中，请注意查看");
			}catch(Exception e){
				e.printStackTrace();
			}

		}
	    /**
	     * Method: saveHtml 
	     * Description: save String to file
	     * @param filepath
	     * file path which need to be saved
	     * @param str
	     * string saved
	     */
	    public static void saveHtml(String filepath, String str){
	        
	        try {
	            /*@SuppressWarnings("resource")
	            FileWriter fw = new FileWriter(filepath);
	            fw.write(str);
	            fw.flush();*/
	            OutputStreamWriter outs = new OutputStreamWriter(new FileOutputStream(filepath, true), "utf-8");
	            outs.write(str);
	            outs.close();
	        } catch (IOException e) {
	            System.out.println("Error at save html...");
	            e.printStackTrace();
	        }
	    }
	    /**
	     * Method: InputStream2String 
	     * Description: make InputStream to String
	     * @param in_st
	     * inputstream which need to be converted
	     * @param charset
	     * encoder of value
	     * @throws IOException
	     * if an error occurred 
	     */
	    public static String InputStream2String(InputStream in_st,String charset) throws IOException{
	        BufferedReader buff = new BufferedReader(new InputStreamReader(in_st, charset));
	        StringBuffer res = new StringBuffer();
	        String line = "";
	        while((line = buff.readLine()) != null){
	            res.append(line);
	        }
	        return res.toString();
	    }
	}

