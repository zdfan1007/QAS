<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>managerself</title> 
    <meta name="keywords" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="<%=path%>/script/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/script/login.js"></script>
    <link href="<%=path%>/css/managerself2.css" rel="stylesheet" type="text/css" />
</head>
<body>

<h1>修改个人信息</h1>

<% 
String str1 = (String)session.getAttribute("1");
String str2 = (String)session.getAttribute("2");
String str3 = (String)session.getAttribute("3");
String str4 = (String)session.getAttribute("4");
%>

<div class="login" style="margin-top:60px;">
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 315px;">
        <div class="web_login" id="web_login">
            <div class="login-box">
			    <div class="login_form">
				    <form class="loginForm" action="managerselfcheck" name="loginform" id="login_form" accept-charset="utf-8" method="post">
				        <input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
               
                        <div class="loginHint" id="loginHint">${param.result}</div>
                        
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">名称：</label>
                            <div class="inputOuter" id="uArea">
                                <input type="text" id="u" name="username" value="<%=str2%>" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                           <label class="input-tips" for="p">密码：</label> 
                           <div class="inputOuter" id="pArea">
                                <input type="text" id="p" name="password" value="<%=str3%>" class="inputstyle"/>
                           </div>
                        </div>
                        <div class="uinArea" id="uinArea">
                           <label class="input-tips" for="u">邮箱：</label>
                           <label class="input-tips" for="u"><%=str4%></label>
                        </div>
                        <div style="padding-left:50px;margin-top:20px;">
                            <input type="submit" value="确认修改" style="width:150px;" class="button_blue"/>
                            <a href="inputquestion" class="zcxy" target="_self"> 返 回 </a>
                            <!-- target="_blank"新窗口打开链接,_parent在父窗体中打开链接 ,_self在当前窗体打开链接,此为默认值 ,_top在当前窗体打开链接，并替换当前的整个窗体(框架页)-->
                        </div>
                    </form>
               </div>
           </div>
       </div>
   </div>
</div>

</body>
</html>