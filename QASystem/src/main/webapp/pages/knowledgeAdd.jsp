<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cn.bysj.jdbc.DbOperate"%>
<%@ page 
  language="java" 
  import="java.io.*,java.util.*,com.cn.bysj.training.SimilarityBetweenQA,org.ansj.app.keyword.KeyWordComputer,org.ansj.splitWord.analysis.NlpAnalysis" 
  contentType="text/html;charset=utf-8"%>  
<%  
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>questionStatusUpdate</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head> 

<body>  
<%  
    request.setCharacterEncoding("utf-8");
	//获取ajax传递过来的表单的title和content
	String title = request.getParameter("title");
	System.out.println("title: " + title);
	String content = request.getParameter("content");
	//System.out.println("content: " + content);
	
	//首先判断该title在数据库中是否存在，若存在则不插入并返回提示信息
	String sql = "select id from knowledge_data where title = ?";
	Object obj = DbOperate.queryForParam(sql, title);
	if(obj != null){
		int id = (Integer)obj;
		System.out.println("title已存在，id: " + id);
		
		response.getWriter().print("标题已存在！");
		//response.getWriter().write("title已存在");
	}else{
		//将title和content处理,获取title对应的keywords
		int keywordsNum = 5;   //抽取关键词个数
		//计算关键词
		List<String> titleKeywords = SimilarityBetweenQA.useANSJGetKeyWords(title,null,keywordsNum);
		//System.out.println(titleKeywords);
		//将关键词list转换成 string
		StringBuilder keywords = new StringBuilder();
		for(String str : titleKeywords){
			keywords.append(str + " ");
		}
		System.out.println("keywords: " + keywords.toString());
		//生成随机串代表url
		String url = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss/").format(new Date()) + (int)(Math.random()*10000);
		System.out.println("url: " + url);
		//插入数据库
		String sql1 = "insert into knowledge_data(url,title,keywords,content) values(?,?,?,?)";
	    int flag = DbOperate.update(sql1, url, title, keywords.toString(), content);
		if(flag == 0){
			response.getWriter().print("服务器异常！");
		}else{
			response.getWriter().print("添加成功！");
		}
	}
	
	
	
%>  
  
</body>  
</html> 