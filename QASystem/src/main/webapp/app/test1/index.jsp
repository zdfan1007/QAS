<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    
<head>
        
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<title>用户登录</title>
    
<style type="text/css">
body 
.STYLE1 {
	color: black;
	font-weight: bold;
	font-size: 32px;
}
.STYLE2 {
	color: black;
	font-weight: bold;
	font-size: 16px;
a{ font-family: "方正行楷";}
}
.STYLE3 {font-size: 14px}
</style></head>
<body>
        
<table width="800" border="0" align="center">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td> 
  </tr>
   <body  style="background:url('2.jpg') no-repeat;">
</body>
<td colspan="3" align="center"><img src="6.jpg" width="800" height="200" /></td>
<form name="myform" action="checkUser1.jsp" method="POST">
               
<table align="center"> 
                    
<tr>
                        
   <td align="center">
<font face="华文行楷"><span class="STYLE1">考勤管理系统登录界面 </span></font></td>
                    
</tr>
 
 <tr>
    <td colspan="3" align="center"><form id="form1" name="form1" method="post" action="pages/checkUser1.jsp">
      <table width="400" border="0" bordercolor="#5A92E7">
        <tr>
          <td colspan="2"><span class="STYLE2">登录身份：</span>
           </td>
          </tr>
<tr>
 <td width="142"><span class="STYLE3">
 <input name="radiobutton" type="radio" value="1" checked="checked" />
管理员</span></td>
 <td width="142"><span class="STYLE3">
 <input type="radio" name="radiobutton" value="2" />普通用户</span></td>
 </tr>                   
<tr>
         
    <td>用户名:</td>
                        
     <td><input type="text" name="name" /></td>
                        
     <td><a href="changePSW.jsp">修改密码</a></td>
                    
</tr>
                    
<tr>
                        
     <td>密码:</td>
             
     <td><input type="password" name="pwd" value="" /></td>
                        
     <td><a href="zhuce.jsp">注册用户</a></td>
              
      </tr>
                    <tr>
                      
  <td  align="right">
<input type="submit" value="登  录" name="" />
  
 
</td>                     
<td>&nbsp;</td> <td  align="left">       <input type="reset" value="重  置" name="" /></td>
                    </tr>
                </table>
        </form>
    </body>
</html>
