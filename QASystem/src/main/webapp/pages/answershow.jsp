<%@ page language="java"  contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*,java.io.*,java.util.*,com.cn.bysj.jdbc.*" %>

<%  
  String path = request.getContextPath();  
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>answershow</title>
    <meta name="keywords" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="<%=path%>/css/outputanswer2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/script/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/script/outputanswer.js"></script>
</head>

<body>

<%
	String question = (String)request.getAttribute("question");
	LinkedHashMap<String,Float> topNResult = (LinkedHashMap)request.getAttribute("topNResult");
%>  

<h1><%=question%></h1>
<div class="out">
    <div class="web_qr_login" id="web_qr_login">
        <label class="input-tips">
            <%
            //7.输出TopN的结果
            int i = 1;
            for(Map.Entry<String, Float> entity:topNResult.entrySet()){
                String str1 = i+".";
                String str2 = "相关度："+entity.getValue();
                //数据库表中查询title所对应的答案
        		//1. create sql
                String sql = "select content from knowledge_data where title=?";
                //2. 执行sql语句,并传入参数
                String answer = (String)DbOperate.queryForParam(sql, entity.getKey());
                session.setAttribute("answer",answer);
            %>
            <div class="showdiv">
                <%=str1%>&nbsp;&nbsp;<a><%=entity.getKey()%></a>&nbsp;&nbsp;&nbsp;&nbsp;<%=str2%><br/>
            </div>
            <%
	            i++;
	        }
            %>
        </label>
        <div class="showbox">
            <h2><%=question%><a class="close" href="#">关闭</a></h2>
            <div class="mainlist">
                <p><%=session.getAttribute("answer")%></p>
            </div>
        </div>
        <div id="zhezhao"></div>
    </div>
</div>

</body>
</html>
