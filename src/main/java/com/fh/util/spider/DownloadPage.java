package com.fh.util.spider;


import java.io.IOException;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.apache.james.mime4j.field.ParseException;


/**
 * 
 * @author liuyazhuang
 *
 */
public class DownloadPage {

	/**
	 * 根据URL抓取网页内容
	 * 
	 * @param url
	 * @return
	 */
	public static String getContentFormUrl(String url) {
		/* 实例化一个HttpClient客户端 */
		HttpClient client = new DefaultHttpClient();
		HttpGet getHttp = new HttpGet(url);

		String content = null;
		HttpResponse response;
		try {
			/* 获得信息载体 */
			response = client.execute(getHttp);
			
			HttpEntity entity = response.getEntity();

			
			
			
			String charset = null;
			try {
				charset = getContentCharSet(entity);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			VisitedUrlQueue.addElem(url);

			if (entity != null) {
				/* 转化为文本信息 */
				content = EntityUtils.toString(entity,charset);

				/* 判断是否符合下载网页源代码到本地的条件 */
				if (FunctionUtils.isCreateFile(url)
						&& FunctionUtils.isHasGoalContent(content) != -1) {
					FunctionUtils.createFile(
							FunctionUtils.getGoalContent(content), url);
				}
			}

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			client.getConnectionManager().shutdown();
		}

		return content;
	}
	 public static String getContentCharSet(final HttpEntity entity) 
		        throws ParseException { 
		 
		        if (entity == null) { 
		            throw new IllegalArgumentException("HTTP entity may not be null"); 
		        } 
		        String charset = null; 
		        if (entity.getContentType() != null) {  
		            HeaderElement values[] = entity.getContentType().getElements(); 
		            if (values.length > 0) { 
		                NameValuePair param = values[0].getParameterByName("charset" ); 
		                if (param != null) { 
		                    charset = param.getValue(); 
		                } 
		            } 
		        } 
		       
		        if(StringUtils.isEmpty(charset)){
		            charset = "UTF-8";
		        }
		        return charset; 
		    }

}