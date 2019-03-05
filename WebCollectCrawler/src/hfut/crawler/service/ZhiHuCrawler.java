package hfut.crawler.service;

import java.util.regex.Pattern;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import hfut.crawler.dbhelper.JDBCTemplate;

public class ZhiHuCrawler extends BreadthCrawler{
	
	    JdbcTemplate jdbcTemplate = null;
		public ZhiHuCrawler(String crawlPath, boolean autoParse) {
			super(crawlPath, autoParse);
			
	        JDBCTemplate gjdbcTemplate = new JDBCTemplate();
	        jdbcTemplate = gjdbcTemplate.getJdbcTemplate();
	        
			this.addSeed("http://www.zhihu.com/question/35667144");
			
			  /*正则规则设置*/
	        this.addRegex("^http://www.zhihu.com/question/[0-9]+");
	        
            /*不要爬取 jpg|png|gif*/
            this.addRegex("-.*\\.(jpg|png|gif).*");
        
            /*不要爬取包含 # 的URL*/
           this.addRegex("-.*#.*");
		}
		
		  /*
	    visit函数定制访问每个页面时所需进行的操作
	  */  
	    @Override
		public void visit(Page page,CrawlDatums arg1) {
	    	    
			    String question_regex="^http://www.zhihu.com/question/[0-9]+";
			    if(Pattern.matches(question_regex, page.getUrl())){
			      String url = page.getUrl();
			      String title = page.select("div[id=zh-question-title]").text().trim();
			      String question=page.select("div[id=zh-question-detail]").text().trim();
			      String totalanswer = page.select("div[class=zh-answers-title clearfix]>h3[id=zh-question-answer-num]").text();
			     
			      System.out.println("url: "+url+"\ntitle: "+title+"\nquestion: "+question+"\ntotalanswer: "+totalanswer);
			      
			      totalanswer = totalanswer.replaceAll("[^0-9]", "").trim();
			      if(totalanswer.equals(""))
			    	  totalanswer="0";
			      
		            if (jdbcTemplate != null) {
		            	int result = jdbcTemplate.queryForInt("select count(*) from zhihu_data where url =?",new Object[]{url});
		            	if(result<1){
			                int updates=jdbcTemplate.update("insert into zhihu_data"
			                    +" (url,title,question,totalanswer) value(?,?,?,?)",
			                         url, title,question,totalanswer);
			                if(updates==1){
			                    System.out.println("zhihu_data表成功插入数据！");
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