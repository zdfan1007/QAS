<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>  
<%  
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>inputquestion</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="<%=path%>/script/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="<%=path%>/script/inputquestion.js"></script> -->
    <link href="<%=path%>/css/inputquestion2.css" rel="stylesheet" type="text/css" />
</head>

<body>

<% 
String str1 = (String)session.getAttribute("1");
String str2 = (String)session.getAttribute("2");
String str3 = (String)session.getAttribute("3");
String str4 = (String)session.getAttribute("4");
%>

<div id="page">
    <h1></h1>
    <form action="outputanswer" id="searchForm" method="post">
		<fieldset>
           	<input id="s" type="text" name="question" />
            <input type="submit" value="Submit" id="submitButton" />
            <div id="searchInContainer"></div>
            <div id="searchInContainer"></div>
        </fieldset>
    </form>
    <div id="resultsDiv"></div>
</div>

<div style="text-align:center;clear:both">
    <p>欢迎进入QAS，<%=str2%>，<a href="managerself" target="_self">点击这里</a>修改我的信息，<a href="userquestionmanage" target="_self">点击这里</a>查看我的提问记录</p><br/><br/>
    <p>爱汽车，爱生活</p>
</div>

</body>
</html>
