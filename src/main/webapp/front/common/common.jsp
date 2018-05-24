<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/15
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@page import="com.enterprise.core.SystemManage" %>
<%@page import="com.enterprise.entity.SystemSetting" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <script type="text/javascript" src="<%=path %>/resource/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/js/jquery.SuperSlide.2.1.1.js"></script>
</head>

<%
    SystemSetting s=SystemManage.getInstance().getSystemSetting();
    if (s != null && StringUtils.isNotBlank(s.getIsopen())
            && !Boolean.valueOf(s.getIsopen())) {
%>
    <%@include file="/front/common/close.jsp" %>
<%
        return;
    }
%>


