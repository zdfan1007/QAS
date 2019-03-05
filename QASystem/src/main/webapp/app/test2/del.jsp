<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>删除员工</title>
<style type="text/css">
body {
	background-color: #cfe5f2;
}
.STYLE1 {
	color: #536895;
	font-weight: bold;
	font-size: 34px;
}
</style>
</head>
<body>
<table align="center"> 
  
    <td colspan="3" align="center"><img src="6.jpg" width="800" height="200" /></td>                  
<tr>
                        
   <td align="center">
<font face="华文行楷"><span class="STYLE1">考勤管理系统删除员工</span>
</font></td>                
</tr>
<form name="myform" action="delete.jsp" method="POST">
               
<table width="400"border="0" height="150" align="center"> 
<tr>       
    <td>请输入要删除的工号:</td>                    
     <td><input type="text" name="id" /></td> 
</table>	 
	<table width="800"border="0" height="100" align="center">                       
  <td  align="center">
<input type="submit" value="确 认 删 除" name="" />
  </td>  
   </table>
        </form>
        <p align="center"><span class="STYLE6"><a href="information1.jsp">返回 》》</a></a></span></p>
       <hr /></td>
</body>
</html>	