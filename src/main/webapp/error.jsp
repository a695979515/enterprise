<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/7/8
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@page import="com.enterprise.core.SystemManage" %>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="description" content="<%=SystemManage.getInstance().getSystemSetting().getDescription() %>"/>
    <meta name="keywords" content="<%=SystemManage.getInstance().getSystemSetting().getKeywords() %>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=SystemManage.getInstance().getSystemSetting().getTitle()%>
    </title>
    <link rel="shortcut icon" type="image/x-icon"
          href="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %><%=SystemManage.getInstance().getSystemSetting().getFavicon() %>">
    <link rel="stylesheet" href="<%=path%>/resource/css/style.css">
</head>
<body>
<div style="width:400px;height:291px;margin: auto;background: url('<%=path%>/resource/images/error.png');margin-top: 200px;">
</div>
<div style="width:640px;margin: auto;text-align: center;font-size: 18px;margin-top:50px;">
    <a href="<%=SystemManage.getInstance().getSystemSetting().getWww() %>"><< 返回主页</a>
</div>


</body>
</html>