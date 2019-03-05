<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<center><title>员工信息</title> </center>
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
    ResultSet rs=stmt.executeQuery("select * from information");  
%>
<table align="center"> 
                    
<tr>
                        
   <td align="center">考勤管理系统员工信息</td>
                    
</tr>
 
<table width="450"border="100" style="border:2px" align="center">                
<tr>
 <td>工号</td>
  <td>姓名</td>
  <td>性别</td>
  <td>年龄</td>
  <td>职位</td>
  <td>电话</td>
  <td>学历</td>
</tr>
<%
  		 while (rs.next())     	
	 {   
out.print("<tr>");
out.print("<td> " + rs.getString("id") + "</td>");
out.print("<td> " + rs.getString("name") + "</td>");    
out.print("<td>" + rs.getString("sex") + "</td>");  
out.print("<td> " + rs.getString("age")+ "</td>");
out.print("<td> " + rs.getString("position")+ "</td>");
out.print("<td> " + rs.getString("number")+ "</td>");
out.print("<td> " + rs.getString("education")+ "</td>");
       }  
    		
rs.close();        stmt.close();            }
    
	catch (SQLException e)
      	
{ 	System.out.println("SQLException:"+e.getMessage()); }
 

	%>
</body>
</html>
