<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8"%> 
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<title>修改员工信息</title>
</head>
  <BODY>
  <center>
  <%
  if(request.getParameter("id").equals("")){
	  %>
					<script language="javascript">
					alert("请输入完整信息！！");
					window.location='modify.jsp';
					</script>
<% }
  else{
	String id=null;
	id = request.getParameter("id");
	String name =null;
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
		String UpdateSql =  "UPDATE information  SET id='"+id1+"' ,  name='"+name1+"' , sex='"+sex1+"' ,  age='"+age1+"' ,position='"+position1+"',number='"+number1+"',education='"+education1+"' WHERE id='"+id1+"'" ;  
        stmt.executeUpdate(UpdateSql);  
%>
<script language="javascript">
alert("修改成功！");
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
