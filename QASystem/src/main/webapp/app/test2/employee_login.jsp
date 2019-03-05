<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>员工登录信息</title> 
<style type="text/css">
body {
	background-color:  #ded3d1;
}
</style>
</head>
 <body  style="background:url('8.jpg') no-repeat;">
</body>
<td colspan="3" align="center"><img src="7.jpg" width="800" height="200" /></td>
<body>
	<%
    try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String strURL="jdbc:mysql://localhost:3306/attend-system";
    String user="root";
    String password="root";
    Connection conn=DriverManager.getConnection(strURL,user,password);
    Statement stmt = conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from employee_login");  
%>
<tr><td> <h2>职工登录信息</h2></td></tr>
<table width="450"border="100" style="border:2px" align="center">                
<tr>
 <td>工号</td>
  <td>密码</td>
</tr>
<%
  		 while (rs.next())     	
	 {   
out.print("<tr>");
out.print("<td> " + rs.getString("id") + "</td>");
out.print("<td> " + rs.getString("password") + "</td>");    
       }  
    		
rs.close();        stmt.close();            }
    
	catch (SQLException e)
      	
{ 	System.out.println("SQLException:"+e.getMessage()); }
 
 
 
	%>
</body>
</html>
