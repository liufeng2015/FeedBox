package com.fh.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Fields;
import org.apache.poi.hwpf.usermodel.Range;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class ReadAndWriteDoc {
	
	
	
	public static void genDoc(Map<String, String> map, String templatePath,String newFilePath) {
		
//		String fileName = code + ".doc";
//		try {
//		/* ------------------------------------------------------------------- */    
//        /* You should do this ONLY ONCE in the whole application life-cycle:   */    
//    
//        /* Create and adjust the configuration */
//        Configuration cfg = new Configuration();
//        cfg.setDirectoryForTemplateLoading(
//                new File(path));
//        cfg.setObjectWrapper(new DefaultObjectWrapper());
//
//        /* ------------------------------------------------------------------- */    
//        /* You usually do these for many times in the application life-cycle:  */    
//                
//        /* Get or create a template */
//        Template temp = cfg.getTemplate(templateStorename, "UTF-8");
//        temp.setEncoding("UTF-8");
//        /* Create a data-model */
//      
//
//        /* Merge data-model with template */
//        Writer out = new OutputStreamWriter(new FileOutputStream(path+fileName), "UTF-8");
//        
//        temp.process(map, out);
//        out.flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		try {
			
			//读取word模板
			FileInputStream in = new FileInputStream(new File(templatePath));
			HWPFDocument hdt = new HWPFDocument(in);
			Fields fields = hdt.getFields();
			
			
			//读取word文本内容
			Range range = hdt.getRange();
			//System.out.println(range.text());
			//替换文本内容
			for (Map.Entry<String,String> entry:map.entrySet()) {
				range.replaceText(entry.getKey(),entry.getValue());
			}    
			ByteArrayOutputStream ostream = new ByteArrayOutputStream();
			
			FileUtil.createFileDir(newFilePath);
			FileOutputStream out = new FileOutputStream(newFilePath,true);
			hdt.write(ostream);
           //输出字节流
			out.write(ostream.toByteArray());
			out.close();
			ostream.close();
			
			in.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	


	public static void main(String args[]) {
//		try{
//			Configuration cfg = new Configuration();
//	        cfg.setDirectoryForTemplateLoading(
//	                new File("E:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FHM/uploadFiles/file/20160912/"));
//	        cfg.setObjectWrapper(new DefaultObjectWrapper());
//
//	        /* ------------------------------------------------------------------- */    
//	        /* You usually do these for many times in the application life-cycle:  */    
//	                
//	        /* Get or create a template */
//	        Template temp = cfg.getTemplate("a1.doc","UTF-8");
//	        Map<String,String> map = new HashMap<String, String>();
//	        map.put("${A}", "dddd");
//	        
//	        /* Create a data-model */
//	      
//
//	        /* Merge data-model with template */
//	        Writer out = new OutputStreamWriter(new FileOutputStream("E:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FHM/uploadFiles/file/20160912/AA.doc"));
//	        temp.process(map, out);
//	        out.flush();
//			} catch (IOException e) {
//				e.printStackTrace();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
		
		try {
			
			 Map<String,String> map = new HashMap<String, String>();
		     map.put("${A}", "dddd");
			//读取word模板
			FileInputStream in = new FileInputStream(new File("E:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FHM/uploadFiles/file/20160912/a1.doc"));
			HWPFDocument hdt = new HWPFDocument(in);
			Fields fields = hdt.getFields();
			
			
			//读取word文本内容
			Range range = hdt.getRange();
			//System.out.println(range.text());
			//替换文本内容
			for (Map.Entry<String,String> entry:map.entrySet()) {
				range.replaceText(entry.getKey(),entry.getValue());
			}    
			ByteArrayOutputStream ostream = new ByteArrayOutputStream();
			
			FileOutputStream out = new FileOutputStream("E:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FHM/uploadFiles/file/20160912/AA.doc",true);
			hdt.write(ostream);
            //输出字节流
			out.write(ostream.toByteArray());
			out.close();
			ostream.close();
			
			in.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
