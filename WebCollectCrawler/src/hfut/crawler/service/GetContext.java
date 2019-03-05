package hfut.crawler.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.ansj.app.keyword.KeyWordComputer;
import org.ansj.app.keyword.Keyword;
//import org.ansj.splitWord.analysis.DicAnalysis;
import org.ansj.splitWord.analysis.NlpAnalysis;
//import org.ansj.splitWord.analysis.ToAnalysis;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;
import hfut.crawler.dbhelper.JDBCTemplate;

public class GetContext extends BreadthCrawler {
	
	JdbcTemplate jdbcTemplate = null;
	
	public static List<String> GetWebUrl() throws IOException {
		String pathname = "D:\\workspace\\workspace-sts-3.7.0.RELEASE\\WebCollectCrawler\\getUrl.txt"; 
		File filename = new File(pathname); // 要读取以上路径的getUrl.txt文件  
		InputStreamReader isr = new InputStreamReader(new FileInputStream(filename)); // 建立一个输入流对象reader  
        LineNumberReader lnr = new LineNumberReader(isr);  
        BufferedReader br = new BufferedReader(isr); // 建立一个对象，它把文件内容转成计算机能读懂的语言  
        
        List<String> list = new LinkedList<>();
        String s;  
        while((s = lnr.readLine())!=null){
        	list.add(s);
        }
        br.close();
//      System.out.println(list.size());
        return list;
    }  

    public GetContext(String crawlPath, boolean autoParse) {
    	
        super(crawlPath, autoParse);
        
        JDBCTemplate gjdbcTemplate = new JDBCTemplate();
        jdbcTemplate = gjdbcTemplate.getJdbcTemplate();
        
        /*种子页面（启示页面）*/
        String[] classifiedStr =new String[]{"fdj","csfj","dpxt","rcby","dqsb","ylsy","qcmr"};
        for(int i =0;i<classifiedStr.length;i++){
    	    String urlStr = "http://www.qcwxjs.com/html/xiaozhishi/"+classifiedStr[i]+"/index.htm";
            this.addSeed(urlStr);
        }

        /*正则规则设置*/
        this.addRegex("http://www.qcwxjs.com/html/xiaozhishi/.*htm");
        
        /*不要爬取 jpg|png|gif*/
        this.addRegex("-.*\\.(jpg|png|gif).*");
    
        /*不要爬取包含 # 的URL*/
        this.addRegex("-.*#.*");
    }
    
//  public static List<String> url = new LinkedList<>();
//	public static List<String> title = new LinkedList<>();
//	public static List<String> content = new LinkedList<>();
    
    public String[] regex = {"p[align=left]","p[align=justify]"};
    List<Keyword> keywordArr = new ArrayList<Keyword>();
    
    KeyWordComputer kwc = new KeyWordComputer(5,new NlpAnalysis());
    @Override
    public void visit(Page page, CrawlDatums next) {
    	List<String> lineUrls = null;
		try {
			lineUrls = GetContext.GetWebUrl();
		    for(String lineUrl : lineUrls){
                /*判断是否为目标页，通过正则可以轻松判断*/
                if (page.matchUrl(lineUrl)) {
//        	        url.add(lineUrl);  //获取链接
	                /*通过CSS选择器解析网页的标题和内容*/
                	String title = page.select("title").first().text();  //获取标题数据
                	String content = page.select(regex[0]).text(); //获取内容数据   
                	if(content.length()<5){
                		content = page.select(regex[1]).text(); //获取内容数据   
                	}
                	String keywords = "";
                	keywordArr = kwc.computeArticleTfidf(title);
                    Iterator<Keyword> iter = keywordArr.iterator();
                	while(iter.hasNext()){
                		Keyword key = iter.next();
                		keywords += key.getName() + " ";
                		//keywords += key.getName() + key.getScore() + " ";
                	}
//        	        System.out.println("URL:" + lineUrl + "\tTitle:" + title + "Keywords" + keywords);
	         
                    if (jdbcTemplate != null) {
                    	int result = jdbcTemplate.queryForInt("select count(*) from knowledge_data where url =?",new Object[]{lineUrl});
                    	if(result<1){
                            int updates=jdbcTemplate.update("insert into knowledge_data"
                                +" (url,title,keywords,content) value(?,?,?,?)",
                                     lineUrl,title,keywords,content);
                            if(updates==1){
                                System.out.println("knowledge_data表成功插入数据！");
                            }
                       }else{
                    	   System.out.println("该链接下的数据已被爬取过！");
                       }
                    }else{
                    	System.out.println("获取jdbcTemplate出现异常！\n");
                    }
    /*如果你想添加新的爬取任务，可以向next中添加爬取任务，这就是上文中提到的手动解析*/
    /*WebCollector会自动去掉重复的任务(通过任务的key，默认是URL)，因此在编写爬虫时不需要考虑去重问题，
     * 加入重复的URL不会导致重复爬取*/
    /*如果autoParse是true(构造函数的第二个参数)，爬虫会自动抽取网页中符合正则规则的URL，作为后续任务，
     * 当然，爬虫会去掉重复的URL，不会爬取历史中爬取过的URL。autoParse为true即开启自动解析机制*/
        	        
	                //next.add("http://xxxxxx.com");
                }
		    }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
//    public static List<String> getUrl(){
//    	return url;
//    }
//    
//    public static List<String> getTitle(){
//    	return title;
//    }
//    
//    public static List<String> getContent(){
//    	return content;
//    }
}
