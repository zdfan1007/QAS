<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>  
<%  
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>adminlogincheck</title> 
    <meta name="keywords" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head> 

<body>  
<%  
   request.setCharacterEncoding("utf-8");  
   String adminname=request.getParameter("adminname");  //和adminlogin.jsp中input标签里面的name名一致
   String adminpswd=request.getParameter("adminpswd");  //和adminlogin.jsp中input标签里面的name名一致
   boolean flag=false;  
   PreparedStatement sql=null;    
   ResultSet rs=null;  
   Connection conn=null;  
%>  
  
<%   
    String driver = "com.mysql.jdbc.Driver";    
    String url = "jdbc:mysql://localhost:3306/test";    
    String user = "root";     
    String pswd = "root";    
    Class.forName(driver);    
    conn= DriverManager.getConnection(url,user,pswd);    
    sql =conn.prepareStatement("select * from admin where adminname=? and adminpswd=?");
    sql.setString(1,adminname);
    sql.setString(2,adminpswd);
    rs=sql.executeQuery();
    //System.out.println(rs.next());
    if (rs.next()==true) {
        flag=true;  
        System.out.println(flag);
    }  
    
    rs.close();
    sql.close();
    conn.close();
%> 
 
<!-- 判断是否是正确的登录用户 -->  
<% if (flag==true){ %>  
    <jsp:forward page="managerkb.jsp"/>
<%} else if (flag==false){ 
	out.println("账号或密码错误，3秒后将返回登录页面");
	response.setHeader("refresh","3;url=adminlogin");
} %>  
</body>  
</html> 