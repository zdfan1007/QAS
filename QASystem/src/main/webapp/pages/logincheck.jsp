<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>  
<%  
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>logincheck</title> 
    <meta name="keywords" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head> 

<body>  
<%  
   request.setCharacterEncoding("utf-8");  
   String mail=request.getParameter("mail");  
   String psw=request.getParameter("pswd"); 
   Connection conn=null;  
   boolean flag=false;  
   PreparedStatement sqlquery=null;
   ResultSet rs=null;  
   String language="select * from person where mail=? and password=?";
   
   //String username=request.getParameter("username");  
   //String password=request.getParameter("password");
   //if(username==null && password==null){
   //   username="0";
   //   password="0";
   //}
   //PreparedStatement sqlquery_m=null;
   //boolean rs_m=false;  
   //String language_m="update person set username=? and password=? where mail=?";
%>  
  
<%   
    String driver = "com.mysql.jdbc.Driver";    
    String url = "jdbc:mysql://localhost:3306/test";    
    String user = "root";     
    String pswd = "root";    
    Class.forName(driver);    
    conn= DriverManager.getConnection(url,user,pswd);    
    sqlquery =conn.prepareStatement(language);
    sqlquery.setString(1,mail);  
    sqlquery.setString(2,psw);  
    rs=sqlquery.executeQuery();
    
    if (rs.next()) {  
        flag=true; 
        session.setAttribute("1",rs.getString(1));
        session.setAttribute("2",rs.getString(2));
        session.setAttribute("3",rs.getString(3));
        session.setAttribute("4",rs.getString(4));
        request.setAttribute("state",rs.getInt(5));
    }
    System.out.println(request.getAttribute("state"));
    rs.close();
    sqlquery.close();
    
    //String str1 = (String)session.getAttribute("1");
    //String str2 = (String)session.getAttribute("2");
    //String str3 = (String)session.getAttribute("3");
    //String str4 = (String)session.getAttribute("4");
    
    //if(username==str2 && password==str3){
    //	out.println("信息没有更改，请返回提问吧");
    //}else{
    //	  sqlquery_m =conn.prepareStatement(language_m);
    //    sqlquery_m.setString(1,username);  
	//    sqlquery_m.setString(2,password); 
	//    sqlquery_m.setString(3,str4);
	//    rs_m=sqlquery_m.execute();
	
	//   if (rs_m==true) {  
	//   	out.println("修改成功，请记住修改后的密码");
	//   	System.out.println(rs.getString(1));
	//   }else{
	//   	out.println("信息修改失败");
	//   }
    //}
       
    conn.close();  
%> 

<!-- 判断是否是正确的登录用户 -->  
<%  if (flag==true && ((Integer)request.getAttribute("state") == 1)){ %>  
    	<jsp:forward page="inputquestion.jsp"/>
<%  } 
	else if (flag==true && ((Integer)request.getAttribute("state") == 0)){	
		out.println("该账号已销户，3秒后将返回登录页面");
		response.setHeader("refresh","3;url=login");
	}
	else if (flag==false){ 
		out.println("账号或密码错误，请重新登录或注册，3秒后将返回登录页面");  
    	response.setHeader("refresh","3;url=login");
    } %> 

</body>  
</html> 