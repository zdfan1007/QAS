package hfut.crawler.service;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import hfut.crawler.dbhelper.JDBCTemplate;

import org.springframework.jdbc.core.JdbcTemplate;

public class BaiduZhidaoQicheQACrawler extends BreadthCrawler {

    /**
     * @param crawlPath is the path of the directory which maintains
     * information of this crawler
     * @param autoParse if autoParse is true,BreadthCrawler will auto extract
     * links which match regex rules from pag
     */
	JdbcTemplate jdbcTemplate = null;
    public BaiduZhidaoQicheQACrawler(String crawlPath, boolean autoParse) {
        super(crawlPath, autoParse);
        
        JDBCTemplate gjdbcTemplate = new JDBCTemplate();
        jdbcTemplate = gjdbcTemplate.getJdbcTemplate();
        
        int listNumber =0; //栏目数
        int i = 750;
        while(i>listNumber){
             /*种子页面（启示页面）*/
                 this.addSeed("https://zhidao.baidu.com/search?word=%C6%FB%B3%B5%B1%A3%D1%F8&ie=gbk&site=-1&sites=0&date=0&pn="+i);
                 i-=10;
        }
//            this.addSeed("https://zhidao.baidu.com/search?word=%C6%FB%B3%B5&ie=gbk&site=-1&sites=0&date=0&pn=0");
//        this.addSeed("http://zhidao.baidu.com/question/808723527387533412.html?fr=iks&word=%C6%FB%B3%B5&ie=gbk");

            /*正则规则设置*/
        this.addRegex("http://zhidao.baidu.com/question/.*fr=iks&word=%C6%FB%B3%B5%B1%A3%D1%F8&ie=gbk");
//        this.addRegex("/question/.*word=%C6%FB%B3%B5");
        
            /*不要爬取 jpg|png|gif*/
        this.addRegex("-.*\\.(jpg|png|gif).*");
        
            /*不要爬取包含 # 的URL*/
        this.addRegex("-.*#.*");
    }

    @Override
    public void visit(Page page, CrawlDatums next) {
        

               /*判断是否为百度知道问答详情，通过正则可以轻松判断*/
        if (page.matchUrl("http://zhidao.baidu.com/question/.*")) {
           
	        	    String url = page.getUrl();  //获取新闻链接
		               /*通过CSS选择器解析网页的标题和内容*/
		            String date ="";
		            date = page.select("div[class=hd line]>span[class=grid-r f-aid pos-time answer-time f-pening]").text() ; //获取推荐时间

		            date = page.select("div[class=hd line]>span[class=grid-r f-aid pos-time answer-time f-pening]").text() ; //获取推荐时间
		            String question = "";
	//	            question = page.select("title").first().text();  //获取网页标题数据,即问题
		            question = page.select("div[class=wgt-ask accuse-response line mod-shadow ]>h1>span[class=ask-title]").text();  //获取问题
		            String answer = ""; 
		            if(!page.select("div[class=line content]>pre[class=best-text mb-10]", 0).text().isEmpty()){
		                 answer = page.select("div[class=line content]>pre[class=best-text mb-10]", 0).text(); //获取最佳答案
		            }
		            String referrer = "";
		            referrer = page.select("div[class=ft-info grid]>span").text();   //最佳答案推荐人
		            String agree = "";
		            agree = page.select("div[class=qb-zan-eva]>span[class=iknow-qb_home_icons evaluate evaluate-32]").attr("data-evaluate"); //赞同数
		            String oppose ="";
		            oppose = page.select("div[class=qb-zan-eva]>span[class=iknow-qb_home_icons evaluate evaluate-bad evaluate-32]").attr("data-evaluate"); //反对数
		            
		            System.out.println("Date:"+date+"\tQusetion:"+question+"\tAnswer:"+answer+"\tReferrer:"+referrer+"\tAgree:"+agree+"\tOppose:"+oppose);
		         
		             date = date.replaceAll("[\u4e00-\u9fa5]", "").trim();  //过滤掉日期里的汉字
	//	             question  = question.substring(0, question.indexOf("_")).trim();
		             question  = question.trim();
		             
		             if(!answer.isEmpty())
		                  answer = answer.trim();
		             else 
		            	 answer = "暂时没有最佳答案！";
		             
		             if(!referrer.isEmpty())
		            	 referrer = referrer.trim();
		             else 
		            	 referrer = "暂时没有推荐人";
		           
		            if (jdbcTemplate != null) {
		            	int result = jdbcTemplate.queryForInt("select count(*) from baidu_zhidao_qiche_qa where url =?",new Object[]{url});
		            	if(result<1){
			                int updates=jdbcTemplate.update("insert into baidu_zhidao_qiche_qa"
			                    +" (date,question,answer,referrer,agree,oppose,url) value(?,?,?,?,?,?,?)",
			                    date,question,answer,referrer,agree,oppose,url);
			                if(updates==1){
			                    System.out.println("该链接下的数据已插入表baidu_zhidao_qiche_qa！");
			                }
		               }else{
		            	   System.out.println("该链接下的数据已被爬取过！");
		               }
		            }else{
		            	System.out.println("获取jdbcTemplate出现异常！\n");
		            }
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