<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>JDBC连接数据库</title> 
</head>
<body>
	<%
    try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String strURL="jdbc:mysql://localhost:3306/attend-system";
    String user="root";
    String password="root";
    Connection conn=DriverManager.getConnection(strURL,user,password);
    out.println("数据库连接成功");
    }
    catch(Exception e){
    out.println("无法连接数据库");
    e.printStackTrace();
}
 	

	%>
</body>
</html>