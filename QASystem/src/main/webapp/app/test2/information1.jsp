<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>员工信息</title>
<style type="text/css">
body {
	background-color: #cfe5f2;
}
.STYLE1 {
	color: #536895;
	font-weight: bold;
	font-size: 34px;
}
.STYLE2 {
	color: black;
	font-weight: bold;
	font-size: 14px;
}
</style>
</head>
<body>
	<%
	String id=null;
	id = request.getParameter("id");
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
  
    <td colspan="3" align="center"><img src="6.jpg" width="800" height="200" /></td>                  
<tr>
                        
   <td align="center">
<font face="华文行楷"><span class="STYLE1">考勤管理系统员工信息</span>
</font></td>                
</tr>
<table width="80%" border="1" align="center">
<table width="550"border="100" style="border:2px" align="center">                
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
	</table>
	<table width="400" border="0" align="center">
	 <td><a href="modify.jsp">修改信息</a></td>
	 <td><a href="del.jsp">删除信息</a></td>
	 <td><a href="add.jsp">增加信息</a></td>
 </table>
 </table>
      </form>
        <p align="center"><span class="STYLE6"><a href="admin_guide.jsp">返回 》》</a></a></span></p>
       <hr /></td>
  </tr>
</table>
</body>
</html>
