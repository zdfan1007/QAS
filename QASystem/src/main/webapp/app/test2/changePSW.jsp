<%@ page contentType="text/html; charset=gb2312" language="java" %>
<% request.setCharacterEncoding("gb2312");%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考勤管理系统——更改密码</title>
<style type="text/css">
<!--
body {
	background-color: #BDDBFF;
}
.STYLE6 {font-size: 12px}
-->
</style></head>

<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="80%" border="0" align="center">
  <tr>
    <td><hr />
        <form name="form1" method="post" action="dochangePSW1.jsp">
          <table width="330" border="1" align="center" bordercolor="#5A92E7">
		   <tr>
              <td align="center"><span class="STYLE6">工号</span></td>
              <td align="center"><label>
                <input name="textfield1" type="id" id="textfield1" size="25">
              </label></td>
            </tr>
            <tr>
              <td align="center"><span class="STYLE6">旧密码</span></td>
              <td align="center"><label>
                <input name="textfield2" type="password" id="textfield1" size="25">
              </label></td>
            </tr>
            <tr>
              <td align="center"><span class="STYLE6">新密码</span></td>
              <td align="center"><label>
                <input name="textfield3" type="password" size="25">
              </label></td>
            </tr>
            <tr>
              <td align="center"><span class="STYLE6">再输入一次新密码</span></td>
              <td align="center"><label>
                <input name="textfield4" type="password" size="25">
              </label></td>
            </tr>
            <tr>
              <td colspan="2" align="center"><label>
                <input type="submit" name="Submit" value="提交">
              </label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label> 
                <input type="reset" name="Submit2" value="重置">
                </label></td>
            </tr>
          </table>
      </form>
        <p align="center"><span class="STYLE6"><a href="index.jsp">返回 》》</a></a></span></p>
        <hr /></td>
  </tr>
</table>
</body>
</html>
