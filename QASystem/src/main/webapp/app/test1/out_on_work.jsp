<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>员工出勤信息</title> 
</head>
<body>
	<%
    try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String strURL="jdbc:mysql://localhost:3306/attend-system";
    String user="root";
    String password="root";
    Connection conn=DriverManager.getConnection(strURL,user,password);
    Statement stmt = conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from out_on_work");  
%>
<tr><td> <h2>职工出勤信息</h2></td></tr>
<table width="450"border="100" style="border:2px" align="center">                
<tr>
 <td>工号</td>
  <td>姓名</td>
  <td>开始时间</td>
  <td>结束时间</td>
  <td>出勤记录</td>
</tr>
<%
  		 while (rs.next())     	
	 {   
out.print("<tr>");
out.print("<td> " + rs.getString("id") + "</td>");
out.print("<td> " + rs.getString("name") + "</td>");    
out.print("<td>" + rs.getString("on_time") + "</td>");  
out.print("<td> " + rs.getString("off_time")+ "</td>");
out.print("<td> " + rs.getString("absence_record")+ "</td>");
       }  
    		
rs.close();        stmt.close();            }
    
	catch (SQLException e)
      	
{ 	System.out.println("SQLException:"+e.getMessage()); }
 
 
 
	%>
</body>
</html>
