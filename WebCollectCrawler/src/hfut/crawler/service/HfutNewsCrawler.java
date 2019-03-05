package hfut.crawler.service;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import hfut.crawler.dbhelper.JDBCTemplate;

import org.springframework.jdbc.core.JdbcTemplate;

public class HfutNewsCrawler extends BreadthCrawler {

    /**
     * @param crawlPath is the path of the directory which maintains
     * information of this crawler
     * @param autoParse if autoParse is true,BreadthCrawler will auto extract
     * links which match regex rules from pag
     */
	JdbcTemplate jdbcTemplate = null;
    public HfutNewsCrawler(String crawlPath, boolean autoParse) {
        super(crawlPath, autoParse);
        
        JDBCTemplate gjdbcTemplate = new JDBCTemplate();
        jdbcTemplate = gjdbcTemplate.getJdbcTemplate();
        int listNumber = 10; //栏目数
        int pageNumber = 20;//每个栏目下的页面数
        for(int i = 1;i<listNumber;i++){
        	for(int j=1;j<pageNumber;j++){
             /*种子页面（启示页面）*/
                 this.addSeed("http://news.hfut.edu.cn/list-"+i+"-"+j+".html");
        	}
        }
        
//        this.addSeed("http://news.hfut.edu.cn/list-1-1.html");

            /*正则规则设置*/
        this.addRegex("http://news.hfut.edu.cn/show-.*html");
        
            /*不要爬取 jpg|png|gif*/
        this.addRegex("-.*\\.(jpg|png|gif).*");
        
            /*不要爬取包含 # 的URL*/
        this.addRegex("-.*#.*");
    }

    @Override
    public void visit(Page page, CrawlDatums next) {
        

               /*判断是否为新闻页，通过正则可以轻松判断*/
        if (page.matchUrl("http://news.hfut.edu.cn/show-.*html")) {
       
        	    String url = page.getUrl();  //获取新闻链接
	               /*通过CSS选择器解析新闻网页的标题和内容*/
        	    String title = page.select("title").first().text();  //获取新闻标题数据
	            String date =page.select("div[id=Article]>h2>span[class=t]").first().text() ; //获取新闻发布时间数据
	            String content = page.select("div#artibody", 0).text(); //获取新闻内容数据            
	            System.out.println("URL:" + url+"\tDate:"+date+"\tTitle:"+title);
	         
	             date = date.replaceAll("[^0-9-]", "").trim();
	             title  = title.substring(0, title.indexOf("-")-1).trim();
	             content = content.trim();
	           
	            if (jdbcTemplate != null) {
	            	int result = jdbcTemplate.queryForInt("select count(*) from hfut_news_data where url =?",new Object[]{url});
	            	if(result<1){
		                int updates=jdbcTemplate.update("insert into hfut_news_data"
		                    +" (url,date,title,content) value(?,?,?,?)",
		                         url, date,title,content);
		                if(updates==1){
		                    System.out.println("hfut_news_data表成功插入数据！");
		                }
	               }else{
	            	   System.out.println("该链接下的数据已被爬取过！");
	               }
	            }else{
	            	System.out.println("获取jdbcTemplate出现异常！\n");
	            }
 
	            /*如果你想添加新的爬取任务，可以向next中添加爬取任务，
	            这就是上文中提到的手动解析*/
	           /*WebCollector会自动去掉重复的任务(通过任务的key，默认是URL)，
	           因此在编写爬虫时不需要考虑去重问题，加入重复的URL不会导致重复爬取*/
	         /*如果autoParse是true(构造函数的第二个参数)，爬虫会自动抽取网页中符合正则规则的URL，
	           作为后续任务，当然，爬虫会去掉重复的URL，不会爬取历史中爬取过的URL。
	           autoParse为true即开启自动解析机制*/
	         //next.add("http://xxxxxx.com");

        }
    }
    
}
