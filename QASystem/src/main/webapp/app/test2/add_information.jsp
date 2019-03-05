<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8"%> 
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>增加员工信息</title>
</head>
  <BODY>
  <center>
  <%
  if(request.getParameter("id").equals("")){
 %>
					<script language="javascript">
					alert("请输入完整信息！！");
					window.location='add.jsp';
					</script>
<% }
  else{
	String id=null;
	id = request.getParameter("id");
	String name=null;
	name = request.getParameter("name");
	String sex=null;
	sex = request.getParameter("sex");
	String age =null;
	age = request.getParameter("age");
	String position =null;
	position = request.getParameter("position");
	String number =null;
	number = request.getParameter("number");
	String education =null;
	education = request.getParameter("education");
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
		String strURL="jdbc:mysql://localhost:3306/attend-system";
		String user="root";
		String password="root";
		Connection conn=DriverManager.getConnection(strURL,user,password);
		Statement stmt = conn.createStatement();
		String id1=request.getParameter("id");
		String name1=request.getParameter("name");
		String sex1=request.getParameter("sex");
		String age1=request.getParameter("age");
		String position1=request.getParameter("position");
		String number1=request.getParameter("number");
		String education1=request.getParameter("education");
        String insertSql="insert into information values('"+id1+"','"+name1+"','"+sex1+"','"+age1+"' ,'"+position1+"','"+number1+"','"+education1+"')";  
		System.out.println(insertSql);
         stmt.executeUpdate(insertSql);  
		 %>
<script language="javascript">
alert("增加成功！");
window.location='information1.jsp';
</script>
<%
		conn.close();	
		}
    catch(SQLException e) 
     {  out.print(e);}
}
%>
 </form>
  </center>
  </BODY>
</HTML>
