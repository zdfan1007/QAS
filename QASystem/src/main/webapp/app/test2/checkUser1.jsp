<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录检验</title> 
</head>
  <BODY>
  <center>
  <%
  if(request.getParameter("id").equals("") || request.getParameter("password").equals("")){
%>
<script language="javascript">
alert("用户名和密码不得为空！");
window.location='index.jsp';
</script>
<%
	}
	else{
	
	try{
             Class.forName("com.mysql.jdbc.Driver");
             String strURL="jdbc:mysql://localhost:3306/attend-system";
             String user="root";
             String password="root";
             Connection conn=DriverManager.getConnection(strURL,user,password);
             Statement stmt = conn.createStatement();
             ResultSet rs=stmt.executeQuery("select * from login");
			 String id1=request.getParameter("id");
			 String password1=request.getParameter("password");
			 
		while(rs.next())
		{
			if(id1.equals(rs.getString("id"))&&password1.equals(rs.getString("password"))){
				if(request.getParameter("radiobutton").equals("1"))
					response.sendRedirect("admin_guide.jsp"); 
		        else
					response.sendRedirect("emp_guide.jsp");  
				}  
			else{
%>
				<script language="javascript">
				alert("用户名或密码错误！");
				window.location='index.jsp';
				</script>
<%			
				}
		}
	}
	     catch (SQLException e)  	
          { System.out.println("SQLException:"+e.getMessage()); }
		  }
    
%>
  </center>
  </BODY>
</HTML>