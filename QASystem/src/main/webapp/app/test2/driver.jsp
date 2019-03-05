<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>

	<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
	
	<title>加载JDBC驱动程序</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	out.println("驱动程序加载成功");

   }
catch(Exception e){
	out.println("驱动程序加载失败");
	e.printStackTrace();
}
%>
</body>
</html>