<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>QAS</title> 
    <meta name="keywords" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="<%=path%>/script/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/script/login.js"></script>
    <link href="<%=path%>/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h1>QAS<sup>V2017</sup></h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch">
            <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>
			<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    
        <!--登录-->
        <div class="web_login" id="web_login">
            <div class="login-box">
			    <div class="login_form">
				    <form class="loginForm" action="logincheck" name="loginform" id="login_form" accept-charset="utf-8" method="post">
				        <input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
               
                        <div class="loginHint" id="loginHint">${param.result}</div>
                        
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">帐号：</label>
                            <div class="inputOuter" id="uArea">
                                <input type="text" id="u" name="mail" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                           <label class="input-tips" for="p">密码：</label> 
                           <div class="inputOuter" id="pArea">
                                <input type="password" id="p" name="pswd" class="inputstyle"/>
                           </div>
                        </div>
                        <div style="padding-left:50px;margin-top:20px;">
                            <input type="submit" value="登 录" style="width:150px;" class="button_blue"/>
                            <a href="adminlogin" class="zcxy" target="_self">管理员</a>
                            <!-- target="_blank"新窗口打开链接,_parent在父窗体中打开链接 ,_self在当前窗体打开链接,此为默认值 ,_top在当前窗体打开链接，并替换当前的整个窗体(框架页)-->
                        </div>
                    </form>
               </div>
            </div>
        </div>
        <!--登录end-->
    </div>

    <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
      <div class="web_login">
        <form action="qlogincheck" name="form2" id="regUser" accept-charset="utf-8"  method="post">
	        <input type="hidden" name="to" value="reg"/>
		    <input type="hidden" name="did" value="0"/>
            <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式</div>
                <li>
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="user" maxlength="16" placeholder="4-16位字符" class="inputstyle2"/>
                    </div>
                </li>
                
                <li>
                    <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd" name="passwd" maxlength="16" placeholder="6-16位字符" class="inputstyle2"/>
                    </div>
                </li>
                
                <li>
                    <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="" maxlength="16" placeholder="请确认密码" class="inputstyle2"/>
                    </div>
                </li>
                
                <li>
                    <label for="qq" class="input-tips2">邮箱：</label>
                    <div class="inputOuter2">
                        <input type="text" id="qq" name="qq" maxlength="24" placeholder="请输入邮箱" class="inputstyle2"/>
                    </div>
                </li>
                
                <li>
                    <div class="inputArea">
                        <input id="reg" type="button" value="同意协议并注册" style="margin-top:10px;margin-left:85px;" class="button_blue"/> 
                        <a href="protocol" class="zcxy" target="_self">注册协议</a>
                        <!-- target="_blank"新窗口打开链接,_parent在父窗体中打开链接 ,_self在当前窗体打开链接,此为默认值 ,_top在当前窗体打开链接，并替换当前的整个窗体(框架页)-->
                    </div>
                </li>
                <div class="cl"></div>
            </ul>
        </form>
      </div>
    </div>
    <!--注册end-->
</div>

<div class="tip">爱汽车，爱生活</div>
</body>
</html>