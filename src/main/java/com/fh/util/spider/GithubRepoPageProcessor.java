package com.fh.util.spider;

import java.io.File;
import java.io.IOException;


import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriverService;
import org.openqa.selenium.firefox.FirefoxBinary;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;


public class GithubRepoPageProcessor implements PageProcessor {

    private Site site = Site.me().setRetryTimes(3).setSleepTime(1000);

    public void process(Page page) {

        page.setDownloadSuccess(true);
        
        System.out.println(page.getHtml().all().toString());
        
        
        
//        System.out.println(page.getHtml());
        
    }

    public Site getSite() {
        return site;
    }

    public static void main(String[] args) throws IOException {
//    	
////    	System.setProperty("webdriver.firefox.bin","C:\\Program Files (x86)\\Mozilla Firefox\\geckodriver.exe");
//
//		WebDriver ffDriver = new FirefoxDriver();
//		ffDriver.get("http://www.toutiao.com/a6433709393698685186/");
//		
		
//		System.setProperty("webdriver.chrome.driver","C:\\Users\\gaoyingjie\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe");
//		@SuppressWarnings("deprecation")
//		ChromeDriverService service = new ChromeDriverService.Builder()
//				.usingDriverExecutable(new File("C:\\Users\\gaoyingjie\\AppData\\Local\\Google\\Chrome\\Application\\chromedriver.exe"))
//				.usingAnyFreePort().build();
//		service.start();
//		
//		WebDriver driver = new RemoteWebDriver(service.getUrl(),DesiredCapabilities.chrome());
//
//		// 让浏览器访问 Baidu
//		driver.get("http://weibo.com/2620648747/F86Bi4q4W?type=comment#_rnd1498096004527");
//		try {
//			Thread.sleep(20000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		
//		WebElement webElement = driver.findElement(By.xpath("/html"));
//        
//		System.out.println(webElement.getAttribute("outerHTML"));
//      
//		driver.close();
		
		File pathToBinary = new File("C:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe");
        FirefoxBinary firefoxBinary = new FirefoxBinary(pathToBinary);
        FirefoxProfile firefoxProfile = new FirefoxProfile();
        System.setProperty("webdriver.gecko.driver", "C:\\Program Files (x86)\\Mozilla Firefox\\geckodriver.exe");

        WebDriver driver = new FirefoxDriver(firefoxBinary, firefoxProfile);

        driver.get("http://weibo.com/2620648747/F86Bi4q4W?type=comment#_rnd1498096004527");
        String url = driver.getCurrentUrl();
        try {
			Thread.sleep(20000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        WebElement webElement = driver.findElement(By.xpath("/html"));
        System.out.println(webElement.getAttribute("outerHTML"));
//        System.out.println(url);
        driver.close();

		
		
		
//		
//		
//
//		System.out.println("ffffffffffffffffffffffff");
//		System.out.println(ffDriver.toString());
//    	
//    	URL url=new URL("http://www.toutiao.com/a6433709393698685186/");   
//    	Document doc=null;
//    	try{
//    	doc=Jsoup.connect("http://www.toutiao.com/a6433709393698685186/").timeout(5000).get();
//    	Elements links = doc.select("[href]"); 
////        System.out.println(doc.getElementsByIndexEquals(1).toString());
//        for(int i=0;i<links.size();i++){
//        	System.out.println(links.get(i));
//        }
//    	}catch(Exception e){
//    		e.printStackTrace();
//    	}
//    	Spider.create(new GithubRepoPageProcessor()).addUrl("http://weibo.com/2656274875/F8oHzBfx3?ref=feedsdk&type=comment#_rnd1497859361261")
//    		.addPipeline(new JsonFilePipeline("e:\\webmagic")).thread(5).run();

//    	Spider.create(new GithubRepoPageProcessor()).addUrl("http://www.toutiao.com/a6431847615214731521/").thread(5).run();
//    	Spider.create(new GithubRepoPageProcessor()).addUrl("http://www.baidu.com").thread(5).run();
    }
}