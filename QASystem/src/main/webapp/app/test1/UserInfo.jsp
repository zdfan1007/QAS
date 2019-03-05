<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <form name="myform" action="UserServlet" method="POST">
            <table border="0" align="center">
                <tr>
                    <td> <h2>新用户注册</h2></td>
                </tr>
                <tr>
                    <td>帐号:</td>
                    <td><input type="text" name="name" value="" /></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input type="password" name="pwd" value="" /></td>
                </tr>
                <tr>
                    <td>真实姓名:</td>
                    <td><input type="text" name="userName" value="" /></td>
                </tr>
                <tr>
                    <td>你会那种编程语言</td>
                    <td>
                    <input type="checkbox" name="brand" value="ON" />JAVA
                    <input type="checkbox" name="brand" value="ON" />.NET
                    <input type="checkbox" name="brand" value="ON" />VB
                    <input type="checkbox" name="brand" value="ON" />C++
                    </td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td><input type="text" name="email" value="" /></td>
                </tr>
                <tr>
                    <td>爱好:</td>
                    <td><input type="text" name="like" value="" /></td>
                </tr>
                <tr>
                    <td>地址:</td>
                    <td><textarea name="address" rows="4" cols="20">
                    </textarea></td>
                </tr>
                <tr>
                <td><input type="submit" value="确  定" name="" /></td>
                <td><input type="reset" value="重  置" name="" /></td>
                </tr>
            </table>
            
        </form>
    </body>
</html>
