<%@ page contentType="text/html; charset=gb2312" language="java" %>
<% request.setCharacterEncoding("gb2312");%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考勤管理系统——更改密码</title>
</head>
<body>
<%
if(request.getParameter("textfield1").equals("") || request.getParameter("textfield2").equals("") || request.getParameter("textfield3").equals("")
	 || request.getParameter("textfield4").equals("")){
%>
					<script language="javascript">
					alert("请输入完整信息！！");
					window.location='changePSW.jsp';
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
			 String id1=request.getParameter("textfield1");
			 String password1=request.getParameter("textfield2"); 
		while(rs.next()){
			if(id1.equals(rs.getString("id"))&&password1.equals(rs.getString("password"))){
	             if (!request.getParameter("textfield4").equals(request.getParameter("textfield3"))){
%>
					<script language="javascript">
					alert("两次输入的密码不一致，请重新输入！！");
					window.location='changePSW.jsp';
					</script>
<%
					}
				else{
					String psw=request.getParameter("textfield3");
					String UpdateSql =  "UPDATE login  SET id='"+id1+"' ,  password='"+psw+"' WHERE id='"+id1+"'" ;  
					stmt.executeUpdate(UpdateSql); 

  %>
					<script language="javascript">
					alert("修改密码成功！！");
					window.location='index.jsp';
					</script>
<%
					}
			}
			else {
%>
				<script language="javascript">
				alert("原密码不正确！！");
				window.location='changePSW.jsp';
				</script> 
%>
<%  			}

			}
		}
	catch (SQLException e)  	
          { System.out.println("SQLException:"+e.getMessage()); }
}
%>
</body>
</html>
