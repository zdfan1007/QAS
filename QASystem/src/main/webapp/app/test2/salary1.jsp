<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>职工工资</title> 
<style type="text/css">
body {
	background-color: #cfe5f2;
}
.STYLE1 {
	color: #536895;
	font-weight: bold;
	font-size: 34px;
}
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
    ResultSet rs=stmt.executeQuery("select * from salary");  
%>
<table align="center"> 
  
    <td colspan="3" align="center"><img src="6.jpg" width="800" height="200" /></td>                  
<tr>
                        
   <td align="center">
<font face="华文行楷"><span class="STYLE1">考勤管理系统员工薪资信息</span>
</font></td>                
</tr>
 
<table width="450"border="100" style="border:2px" align="center">                
<tr>
 <td>工号</td>
  <td>姓名</td>
  <td>基本工资</td>
  <td>绩效工资</td>
  <td>总工资</td>
</tr>
<%
  		 while (rs.next())     	
	 {   
out.print("<tr>");
out.print("<td> " + rs.getString("id") + "</td>");
out.print("<td> " + rs.getString("name") + "</td>");    
out.print("<td>" + rs.getString("base_pay") + "</td>");  
out.print("<td> " + rs.getString("merit_pay")+ "</td>");
out.print("<td> " + rs.getString("total_pay")+ "</td>");
       }  
    		
rs.close();        stmt.close();            }
    
	catch (SQLException e)
      	
{ 	System.out.println("SQLException:"+e.getMessage()); }
 
 
 
	%>
</table>
      </form>
        <p align="center"><span class="STYLE6"><a href="admin_guide.jsp">返回 》》</a></a></span></p>
        <hr /></td>
  </tr>
</table>
</body>
</html>
