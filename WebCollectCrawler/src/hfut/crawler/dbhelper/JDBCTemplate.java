package hfut.crawler.dbhelper;

import org.springframework.jdbc.core.JdbcTemplate;

public class JDBCTemplate {
	  JdbcTemplate  jdbcTemplate = null;
       public JDBCTemplate(){
    	   try {
	       	    jdbcTemplate = JDBCHelper.createMysqlTemplate("mysql",
	       	            "jdbc:mysql://localhost/test?useUnicode=true&characterEncoding=utf8",
	       	            "root", "root", 5, 30);
	       	    
	       	    /*创建knowledge_data数据表,包含了id,url,title,keywords,content*/
	       	    jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS knowledge_data ("
	       	            + "id int(11) NOT NULL AUTO_INCREMENT,"
	       	            + "url varchar(200),"
	       	            + "title varchar(200),"
	       	            + "keywords longtext,"
	       	            + "content longtext,"
	       	            + "PRIMARY KEY (id),"
	       	            +"UNIQUE(url)"
	       	            + ") ENGINE=MyISAM DEFAULT CHARSET=utf8;");
	       	    System.out.println("成功创建数据表 knowledge_data");
	
//	       	    /*创建csdn_data数据表,包含了id,url,title,author*/
//	       	    jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS csdn_data ("
//	       	            + "id int(11) NOT NULL AUTO_INCREMENT,"
//	       	            + "url varchar(200),"
//	       	            + "title varchar(200),"
//	       	            + "date varchar(50),"
//	       	            + "total_view_times varchar(10),"
//	       	            + "total_comments varchar(10),"
//	       	            + "author varchar(30),"
//	       	            + "PRIMARY KEY (id),"
//	       	            +"UNIQUE(url)"
//	       	            + ") ENGINE=MyISAM DEFAULT CHARSET=utf8;");
//	       	    System.out.println("成功创建数据表 csdn_data");
//	       	    
//	       	    /*创建hfut_news_data数据表,包含了id,url,date,title,content*/
//	       	    jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS hfut_news_data ("
//	       	            + "id int(11) NOT NULL AUTO_INCREMENT,"
//	       	            + "url varchar(200),"
//	       	            + "date varchar(100),"
//	       	            + "title varchar(200),"
//	       	            + "content longtext,"
//	       	            + "PRIMARY KEY (id),"
//	       	            +"UNIQUE(url)"
//	       	            + ") ENGINE=MyISAM DEFAULT CHARSET=utf8;");
//	       	    System.out.println("成功创建数据表 hfut_news_data");
//	       	    
//	       	    /*创建zhihu_data数据表,包含了id,url,title,question,totalanswer*/
//	       	    jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS zhihu_data ("
//	       	            + "id int(11) NOT NULL AUTO_INCREMENT,"
//	       	            + "url varchar(200) ,"
//	       	            + "title varchar(200),"
//	       	            + "question longtext,"
//	       	            + "totalanswer varchar(10),"
//	       	            + "PRIMARY KEY (id),"
//	       	            +"UNIQUE(url)"
//	       	            + ") ENGINE=MyISAM DEFAULT CHARSET=utf8;");
//	       	    System.out.println("成功创建数据表 zhihu_data");
	       	    
       	} catch (Exception ex) {
       	    jdbcTemplate = null;
       	    System.out.println("mysql未开启或JDBCHelper.createMysqlTemplate中参数配置不正确!\n"+ ex.getMessage());
       	}
       }
       
       public JdbcTemplate getJdbcTemplate(){
    		   return jdbcTemplate;
     }  
       
}
