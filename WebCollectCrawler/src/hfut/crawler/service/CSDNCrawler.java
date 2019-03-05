package hfut.crawler.service;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import hfut.crawler.dbhelper.JDBCTemplate;

public class CSDNCrawler extends BreadthCrawler {
	JdbcTemplate jdbcTemplate = null;
    public CSDNCrawler(String crawlPath, boolean autoParse) {
        super(crawlPath, autoParse);
        
        JDBCTemplate gjdbcTemplate = new JDBCTemplate();
        jdbcTemplate = gjdbcTemplate.getJdbcTemplate();
        
        /*种子页面（启示页面）*/
        this.addSeed("http://blog.csdn.net/.*");
        
        /*正则规则设置*/
        this.addRegex("http://blog.csdn.net/.*/article/details/.*");
       
    }

    /*
        可以往next中添加希望后续爬取的任务，任务可以是URL或者CrawlDatum
        爬虫不会重复爬取任务，从2.20版之后，爬虫根据CrawlDatum的key去重，而不是URL
        因此如果希望重复爬取某个URL，只要将CrawlDatum的key设置为一个历史中不存在的值即可
        例如增量爬取，可以使用 爬取时间+URL作为key。

        新版本中，可以直接通过 page.select(css选择器)方法来抽取网页中的信息，等价于
        page.getDoc().select(css选择器)方法，page.getDoc()获取到的是Jsoup中的
        Document对象，细节请参考Jsoup教程
    */
    @Override
    public void visit(Page page, CrawlDatums next) {
    	
        if (page.matchUrl("http://blog.csdn.net/.*/article/details/.*")) {
        	String url = page.getUrl();
            String title = page.select("div[class=article_title]").first().text().trim();
            String date = page.select("div[class=article_r]>span[class=link_postdate]").first().text().trim();
            String total_view_times = page.select("div[class=article_r]>span[class=link_view]").first().text();
            String total_comments = page.select("div[class=article_r]>span[class=link_comments]").first().text();
            String author = page.select("div[id=blog_userface]").first().text().trim();
            System.out.println("url:"+url+"\tTitle:" + title + "\tAuthor:" + author);
            
            total_view_times = total_view_times.replaceAll("[^0-9]", "").trim();
            total_comments = total_comments.replaceAll("[^0-9]", "").trim();
            
            if (jdbcTemplate != null) {
            	int result = jdbcTemplate.queryForInt("select count(*) from csdn_data where url =?",new Object[]{url});
            	if(result<1){
	                int updates=jdbcTemplate.update("insert into csdn_data"+" (url,title,date,total_view_times,total_comments,author) value(?,?,?,?,?,?)",url, title,date,total_view_times,total_comments,author);
	                if(updates==1){
	                	System.out.println("csdn_data表成功插入数据！");
	                }
                }else{
	            	   System.out.println("该链接下的数据已被爬取过！");
	            }
            }else{
            	System.out.println("获取jdbcTemplate出现异常！\n");
            }
        }
    }
   
}
