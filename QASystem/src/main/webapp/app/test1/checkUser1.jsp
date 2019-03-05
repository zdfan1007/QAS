<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>µÇÂ¼¼ìÑé</title> 
</head>
<body>
<HTML>
  <BODY>
  <center>
  <%if(request.getParameter("name").equals("")||
request.getParameter("psw").equals(""))
  response.sendRedirect("fullInf.html"); 
  else{
    switch(Integer.parseInt(request.getParameter("radiobutton")))
        {case 1:
          try{
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             String strURL="jdbc:mysql://localhost:3306/attend-system";
             String user="root";
             String password="root";
             Connection conn=DriverManager.getConnection(strURL,user,password);
             Statement stmt = conn.createStatement();
             ResultSet rs=stmt.executeQuery("select * from admin_login");

             if(!request.getParameter("textfield2").equals(request.getParameter("textfield1")))
                 {response.sendRedirect("loginError2.html");}
             else{
                 session.putValue("id",request.getParameter("textfield1"));
                 session.putValue("type","admin");
                 response.sendRedirect("admin_guide.jsp");
                 }
             break;
              }
	     catch (SQLException e)  	
          { System.out.println("SQLException:"+e.getMessage()); }
       case 2:
         try{
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           String strURL="jdbc:mysql://localhost:3306/attend-system";
           String user="root";
           String password="root";
           Connection conn=DriverManager.getConnection(strURL,user,password);
           Statement stmt = conn.createStatement();
           ResultSet rs=stmt.executeQuery("select * from employee_login");

           if(!request.getParameter("textfield2").equals(request.getParameter("textfield1")))
             {response.sendRedirect("loginError2.html"); }
           else{
               session.putValue("id",request.getParameter("textfield1"));
               session.putValue("type","user");
               response.sendRedirect("emp_guide.jsp");
               }
           break;
            }
          catch (SQLException e)    	
           { System.out.println("SQLException:"+e.getMessage()); }
       }
 }
%>
  </center>
  </BODY>
</HTML>