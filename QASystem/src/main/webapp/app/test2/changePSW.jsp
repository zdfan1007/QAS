<%@ page contentType="text/html; charset=gb2312" language="java" %>
<% request.setCharacterEncoding("gb2312");%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ڹ���ϵͳ������������</title>
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
              <td align="center"><span class="STYLE6">����</span></td>
              <td align="center"><label>
                <input name="textfield1" type="id" id="textfield1" size="25">
              </label></td>
            </tr>
            <tr>
              <td align="center"><span class="STYLE6">������</span></td>
              <td align="center"><label>
                <input name="textfield2" type="password" id="textfield1" size="25">
              </label></td>
            </tr>
            <tr>
              <td align="center"><span class="STYLE6">������</span></td>
              <td align="center"><label>
                <input name="textfield3" type="password" size="25">
              </label></td>
            </tr>
            <tr>
              <td align="center"><span class="STYLE6">������һ��������</span></td>
              <td align="center"><label>
                <input name="textfield4" type="password" size="25">
              </label></td>
            </tr>
            <tr>
              <td colspan="2" align="center"><label>
                <input type="submit" name="Submit" value="�ύ">
              </label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label> 
                <input type="reset" name="Submit2" value="����">
                </label></td>
            </tr>
          </table>
      </form>
        <p align="center"><span class="STYLE6"><a href="index.jsp">���� ����</a></a></span></p>
        <hr /></td>
  </tr>
</table>
</body>
</html>
