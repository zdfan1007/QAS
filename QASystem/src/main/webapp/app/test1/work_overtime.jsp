<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>员工加班信息</title> 
<style type="text/css">
body {
	background-color:  #cec8ef;
}
.STYLE1 {
	color: #e3ff00;
	font-weight: bold;
	font-size: 14px;
}
.STYLE3 {font-size: 12px}
</style>
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
    ResultSet rs=stmt.executeQuery("select * from work_overtime");  
%>
<tr><td> <h2>职工加班信息</h2></td></tr>
<table width="450"border="100" style="border:2px" align="center">                
<tr>
 <td>工号</td>
  <td>姓名</td>
  <td>加班原因</td>
  <td>开始时间</td>
  <td>结束时间</td>
  <td>总时间</td>
</tr>
<%
  		 while (rs.next())     	
	 {   
out.print("<tr>");
out.print("<td> " + rs.getString("id") + "</td>");
out.print("<td> " + rs.getString("name") + "</td>");    
out.print("<td>" + rs.getString("reason") + "</td>");  
out.print("<td> " + rs.getString("start_time")+ "</td>");
out.print("<td> " + rs.getString("end_time")+ "</td>");
out.print("<td> " + rs.getString("total_time")+ "</td>");
       }  
    		
rs.close();        stmt.close();            }
    
	catch (SQLException e)
      	
{ 	System.out.println("SQLException:"+e.getMessage()); }
 
 
 
	%>
</body>
</html>
