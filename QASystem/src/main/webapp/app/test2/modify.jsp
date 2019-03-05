<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8"%> 
<html>
<head>
<title>修改员工信息</title>
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
<font face="华文行楷"><span class="STYLE1">考勤管理系统修改员工信息</span>
</font></td>                
</tr>
<form name="myform" action="modify_information.jsp" method="POST">
               
<table width="400"border="0" height="150" align="center"> 
<tr>       
    <td>请输入修改的员工信息:</td>  </tr>                             
<tr><td>工号</td> <td><input type="text" name="id" /></td> </tr>
 <tr> <td>姓名</td> <td><input type="text" name="name" /></td> </tr>
  <tr><td>性别</td>  <td><input type="text" name="sex" /></td> </tr>
  <tr><td>年龄</td>  <td><input type="text" name="age" /></td> </tr>
 <tr> <td>职位</td>  <td><input type="text" name="position" /></td> </tr>
 <tr> <td>电话</td>  <td><input type="text" name="number" /></td> </tr>
<tr>  <td>学历</td>  <td><input type="text" name="education" /></td> </tr>	 
</table>	 
	<table width="800"border="0" height="100" align="center">                       
  <td  align="center">
<input type="submit" value="确 认 修 改" name="" />
  </td>  
   </table>
        </form>
        <p align="center"><span class="STYLE6"><a href="information1.jsp">返回 》》</a></a></span></p>
       <hr /></td>
</body>
</html>	