 <%@ page language = "java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
        <title>加载JDBC驱动程序</title>
</head>
<body>
        <% 
                try
                { 
                        Class.forName("com.mysql.jdbc.Driver"); 
                } 
                catch (ClassNotFoundException e) 
                { 
                        out.println("找不到驱动类"); 
                } 
         %>
</body>
</html>
