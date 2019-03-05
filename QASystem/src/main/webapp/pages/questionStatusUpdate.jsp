<%@page import="com.cn.bysj.jdbc.DbOperate"%>
<%@ page 
  language="java" 
  import="java.io.*,java.util.*,com.cn.bysj.training.SimilarityBetweenQA,com.ansj.vec.Word2VEC,org.ansj.app.keyword.KeyWordComputer,org.ansj.splitWord.analysis.NlpAnalysis" 
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
	//获取ajax传递过来的question的status和id
	String status = request.getParameter("status");
	//System.out.println(status);
	String id = request.getParameter("id");
	//System.out.println(id);
	
	//将question status更新为0，表示用户以删除该记录
	String sql = "update question_history set status = 0 where qid = ?";
    DbOperate.update(sql, id);
	
	
%>  
  
</body>  
</html> 