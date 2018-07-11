<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@page import="com.enterprise.core.SystemManage"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>login</title>
    <style type="text/css">
        body{
            font-size:12px;
        }
        ul, ol {
            list-style: none;
            margin:0px;
            padding: 0px;
        }

        #login .inpLi {
            border: 1px solid #CCC;
        }
        #login .captchaPic {
            height: 38px;
        }

        #login li {
            height: 34px;
            margin-bottom: 15px;
        }

        #login .inpLi b {
            background-color: #E0E0E0;
            float: left;
            display: block;
            width: 70px;
            height: 34px;
            line-height: 34px;
            text-align: center;
            font-weight: normal;
        }

        #login {
            margin: 0px auto;
            width: 368px;
            margin-top: 120px;
            overflow: hidden;
        }

        #login .dologo {
            height: 50px;
            margin-bottom: 30px;
        }

        #login .inpLi .inpLogin {
            width: 280px;
        }
        #login .inpLi .captcha {
            width: 150px;

        }
        #login .inpLi .inpLogin, #login .inpLi .captcha {
            float: left;
            background-color: #EBEBEB;
            border: 0;
            padding: 7px 8px;
            height: 20px;
            line-height: 20px;
            color: #000;
            font-size: 14px;
        }
        #login .sub {
            margin: 30px 0;
            line-height: 34px;
        }
        input[type="checkbox"] {
            margin: 4px 0 0;
            margin-top: 1px \9;
            line-height: normal;
        }
        input[type=checkbox].ace{
            opacity: 1;
            width: 16px;
            height: 16px;
            cursor: pointer;
            float: left;
            margin-top: 9px;
        }

        .btn {
            display: inline-block;
            background-color: #0072C6;
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            border: 0;
            float: right;
            color: #FFF;
            font-size: 14px;
            padding: 8px 40px;
            font-weight: bold;
            text-transform: capitalize;
            cursor: pointer;
            -webkit-appearance: none;
        }
    </style>
</head>

<body>

<div id="login">
    <div class="dologo"></div>
    <form action="<%=path %>/manage/user/login" method="post">
        <div style="heigth: 44px;line-height: 44px;font-size:22px;text-align: center;"><%=SystemManage.getInstance().getSystemSetting().getName() %>后台管理系统</div>
        <div style="height: 26px;line-height: 26px;color: red;text-align: center;">${errorMsg}</div>
        <ul>
            <li class="inpLi"><b>用户名：</b><input type="text" name="username" id="username" class="inpLogin"
                                                placeholder="账号" value="admin"/></li>
            <li class="inpLi"><b>密码：</b><input type="password" name="password" id="password" class="inpLogin" value="123456"
                                               placeholder="密码"/></li>
            <li class="captchaPic">
                <div class="inpLi" style="overflow: hidden;width: 236px;float: left;"><b>验证码：</b><input name="manage_vcode" type="text" class="captcha"></div>
                <img id="manage_vcode" style="float: right;" src="<%=path%>/getVerificationCode" id="codes2"
                     onclick="javaScript:reloadImg2();" title="看不清？点击更换另一个验证码。">
            </li>
            <li class="sub"><input type="checkbox" class="ace" name="remember" value="true">下次自动登录 <input type="submit" name="submit" class="btn" value="登录"></li>


        </ul>


    </form>
</div>
<script>
   function  reloadImg2() {
       document.getElementById("manage_vcode").src = "<%=path%>/getVerificationCode?" + "radom="
           + Math.random();
   }

</script>
</body>
</html>