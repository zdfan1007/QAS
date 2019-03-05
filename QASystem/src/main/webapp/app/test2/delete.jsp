<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>删除员工</title>
</head>
  <BODY>
  <center>
  <%
if(request.getParameter("id").equals("")){
 %>
					<script language="javascript">
					alert("请输入完整信息！！");
					window.location='del.jsp';
					</script>
<%  }
else{
	String id=null;
	id = request.getParameter("id");
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
		String strURL="jdbc:mysql://localhost:3306/attend-system";
		String user="root";
		String password="root";
		Connection conn=DriverManager.getConnection(strURL,user,password);
		Statement stmt = conn.createStatement();
		String id1=request.getParameter("id");
		String deleteSql = "delete from information where id="+id1;
		stmt.executeUpdate(deleteSql); 	
%>
<script language="javascript">
alert("删除成功！");
window.location='information1.jsp';
</script>
<%
		conn.close();	
		}
    catch(SQLException e) 
     {  out.print(e);}
}
%>
  </center>
  </BODY>
</HTML>
