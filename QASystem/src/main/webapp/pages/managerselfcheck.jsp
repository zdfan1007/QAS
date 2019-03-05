<%@ page import="java.sql.*"%>
<%@ page language="java" import="java.util.* " pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>managerselfcheck</title> 
    <meta name="keywords" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<% 
    String str1 = (String)session.getAttribute("1");
    String str2 = (String)session.getAttribute("2");
    String str3 = (String)session.getAttribute("3");
    String str4 = (String)session.getAttribute("4");
%>

<%  
    request.setCharacterEncoding("utf-8");  
    String username=request.getParameter("username");
    String password=request.getParameter("password");  
    boolean flag_m=false;  
    PreparedStatement sqlquery_m=null;
    int rs_m=0;
    Connection conn_m=null;
%>  
  
<%   
    String driver = "com.mysql.jdbc.Driver";    
    String url = "jdbc:mysql://localhost:3306/test";    
    String user = "root";     
    String pswd = "root";    
    Class.forName(driver);    
    conn_m = DriverManager.getConnection(url,user,pswd);
    if(username.equals(str2) && password.equals(str3)){
    	out.println("信息没有更改，请返回提问吧");
    	response.setHeader("refresh","3;url=managerself");
    }else{
    	sqlquery_m =conn_m.prepareStatement("update person set username=? , password=? where mail=?");  
    	sqlquery_m.setString(1,username);  
    	sqlquery_m.setString(2,password); 
    	sqlquery_m.setString(3,str4);
    	rs_m=sqlquery_m.executeUpdate();
    
    	if (rs_m==1) {  
    		//request.getRequestDispatcher("inputquestion.jsp").forward(request, response);	
        	flag_m=true; 
        	session.setAttribute("2",username);
            session.setAttribute("3",password);
    	} 
    	//else{
    	//	out.println("登录失败，请重新登录或注册，3秒后将返回登录页面");  
    	//    response.setHeader("refresh","3;url=login");
    	//}
    	if (flag_m==true){   
    	    out.println("修改成功，请记住您修改后的信息");
    	    response.setHeader("refresh","3;url=managerself");
    	} else if (flag_m==false){
    		out.println("修改失败，请重新尝试");
    		response.setHeader("refresh","3;url=managerself");
    	} 
    	sqlquery_m.close();
    }
    conn_m.close();  
%> 
 
</body>
</html>