package com.fh.util.spider;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpCookie;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Socket;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;


public class SocketScan {
        
        private static final int MAX_SIZE = 5;
        public static List<String> httpContextList = new ArrayList<String>();
        
        public static void main(String[] args) {
                // 得到网站URL，并读取出来
               String httpContext = searchHttpContexts("http://weibo.com/2620648747/F86Bi4q4W?type=comment#_rnd1497842169010");

               System.out.println("httpContext size: "+httpContextList.size());
                
                for (String string : httpContextList) {
                        System.out.println(string);
                        System.out.println();
                        System.out.println("分隔符==============================================================================");
                        System.out.println();
                }
                
        }

        
        private static List<String> GetURLByHttpContext(String httpContext) {
                List<String> urlList = new ArrayList<String>();
                String mark = "href=\"";
                int len = mark.length();
                int start = 0;
                int end = 0 ;
                while((start = httpContext.indexOf(mark,start))!=-1){
                        start = start + len;
                        end = httpContext.indexOf("\"",start);
                        urlList.add(httpContext.substring(start,end));
                }
                return urlList;
        }
        
        
        private synchronized static String searchHttpContexts(String urlPath) {
                try {
                        if(httpContextList.size() > MAX_SIZE){
                                return null;
                        }
                        String sb = getHttpContext(urlPath);
                        httpContextList.add(sb);
                        
                        List<String> urlList = GetURLByHttpContext(sb.toString());
                        if(urlList.size() >0){
                                for (String subUrl : urlList) {
                                        String subHttpContext = searchHttpContexts(subUrl);
                                        if(httpContextList.size() > MAX_SIZE){
                                                return null;
                                        }
                                        httpContextList.add(subHttpContext);
                                }
                        }
                        return sb;
                } catch (UnknownHostException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
                return null;
        }
        
        

        private static String getHttpContext(String urlPath)
                        throws MalformedURLException, IOException {
                URL url = new URL(urlPath);
                URLConnection conn = url.openConnection();
                BufferedInputStream input = new BufferedInputStream(conn.getInputStream());
                byte[] b = new byte[1024];
                int temp;
                StringBuilder sb = new StringBuilder();
                while ((temp = input.read(b)) != -1) {
                        String value = new String(b);
                        sb.append(value);
                }
                return sb.toString();
        }
        
}
        
