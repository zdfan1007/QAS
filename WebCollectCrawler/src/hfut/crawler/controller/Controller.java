package hfut.crawler.controller;

import hfut.crawler.service.BaiduZhidaoQicheQACrawler;
import hfut.crawler.service.CSDNCrawler;
import hfut.crawler.service.ReadSqlContent;
import hfut.crawler.service.HfutNewsCrawler;
import hfut.crawler.service.ZhiHuCrawler;
import hfut.crawler.service.GetContext;

public class Controller {
    public static void main(String[] args) throws Exception{   
    	  
//    	  System.out.println("************************控制台输出被定向到stdout.log文件中********************");
    	  //将控制台输出的数据重定向到文件console
//    	  System.setOut(new PrintStream(new FileOutputStream("log/console.log")));
    	
//        ZhiHuCrawler crawler=new ZhiHuCrawler("crawl", true);  //爬取知乎数据开关
//        HfutNewsCrawler crawler = new HfutNewsCrawler("crawl", true);  //爬取工大新闻数据开关
//        CSDNCrawler crawler = new CSDNCrawler("crawl", true);  //爬取CSDN数据开关
//    	  BaiduZhidaoQicheQACrawler crawler = new BaiduZhidaoQicheQACrawler("crawl_baiduzhidao",true); //爬取百度知道数据开关
          GetContext crawler=new GetContext("crawl", true);  //爬取汽车数据开关
//        ExtractKeywords saveToSql = new ExtractKeywords();
//        saveToSql.extractKeywords();
          /*设置开启爬虫的线程数*/
          crawler.setThreads(5);  //值越大爬取速度越快，但也存在同一个ip访问服务器过于频繁，服务器响应失败的问题。
    
          /*设置每次迭代中爬取数量的上限*/
//        crawler.setTopN(100);   
        
          /*设置是否为断点爬取，如果设置为false，任务启动前会清空历史数据。
                             如果设置为true，会在已有crawlPath(构造函数的第一个参数)的基础上继
                             续爬取。对于耗时较长的任务，很可能需要中途中断爬虫，也有可能遇到
                             死机、断电等异常情况，使用断点爬取模式，可以保证爬虫不受这些因素
                             的影响，爬虫可以在人为中断、死机、断电等情况出现后，继续以前的任务
                             进行爬取。断点爬取默认为false*/
//        crawler.setResumable(true);
   
          /*开始深度为5的爬取，这里深度和网站的拓扑结构没有任何关系
                               可以将深度理解为迭代次数，往往迭代次数越多，爬取的数据越多*/
          crawler.start(5);   
    }
}
