<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="org.apache.commons.lang.StringUtils" %>
<%@page import="org.springframework.web.context.WebApplicationContext" %>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="com.enterprise.service.impl.UserServiceImpl" %>
<%@page import="com.enterprise.service.impl.MenuServiceImpl" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.LinkedHashMap" %>
<%@page import="java.util.List" %>
<%@page import="com.enterprise.entity.Menu" %>
<%@page import="com.enterprise.entity.User" %>
<%@page import="com.enterprise.core.SystemManage" %>
<%@page import="com.enterprise.entity.MenuItem" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Object o = session.getAttribute("manage_session_user_info");
    User u = (User) o;
    if (u == null) {
        Cookie[] cookies = request.getCookies();
        Cookie sCookie;
        String username = null;
        String password = null;
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                sCookie = cookies[i];
                if (sCookie != null) {
                    if (StringUtils.equals(sCookie.getName(), "manage_cookie_username")) {
                        username = sCookie.getValue();
                        System.out.println(username);
                    }
                    if (StringUtils.equals(sCookie.getName(), "manage_cookie_password")) {
                        password = sCookie.getValue();
                        System.out.println(password);
                    }
                }
            }
        }
        if (username != null && password != null && u == null) {
            User e = new User();
            e.setUsername(username);
            e.setPassword(password);
            WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
            UserServiceImpl userServiceImpl = app.getBean(UserServiceImpl.class);
            MenuServiceImpl menuService = app.getBean(MenuServiceImpl.class);
            u = userServiceImpl.login(e);
            session.setAttribute("manage_session_user_info", u);
            Map<String, String> param = new HashMap<String, String>();
            List<Menu> menus = menuService.selectList(param);
            LinkedHashMap<String, MenuItem> root = new LinkedHashMap<String, MenuItem>();
            for (Menu menu : menus) {
                MenuItem item = new MenuItem(menu.getName(), null);
                item.setId(String.valueOf(menu.getId()));
                item.setPid(menu.getPid());
                item.setIcon(menu.getIcon());
                item.setUrl(StringUtils.trim(menu.getUrl()));
                if (item.isRootMenu()) {
                    root.put(item.getId(), item);
                }
            }
            for (Menu menu : menus) {
                MenuItem item = new MenuItem(menu.getName(), null);
                item.setId(String.valueOf(menu.getId()));
                item.setPid(menu.getPid());
                item.setIcon(menu.getIcon());
                item.setUrl(StringUtils.trimToEmpty(menu.getUrl()));
                if (!item.isRootMenu() && !item.isButton()) {
                    MenuItem parentItem = root.get(item.getPid());
                    if (parentItem != null) {
                        parentItem.addChildren(item);
                    }
                }
            }
            session.setAttribute("userMenus", root.values());
        }
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script>
        var basepath = "<%=path%>";
        <% if(u!=null){%>
        var login = true;
        <%}else{%>
        var login = false;
        top.location = "<%=path%>/manage/user/logout";
        <%}%>
    </script>
    <meta name="description" content="<%=SystemManage.getInstance().getSystemSetting().getDescription() %>"/>
    <meta name="keywords" content="<%=SystemManage.getInstance().getSystemSetting().getKeywords() %>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=SystemManage.getInstance().getSystemSetting().getName() %> - 后台管理系统</title>
    <%--图标--%><link rel="shortcut icon" type="image/x-icon"
                    href="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %><%=SystemManage.getInstance().getSystemSetting().getFavicon() %>">


    <script type="text/javascript" src="<%=path %>/resource/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/js/jquery.tab.js"></script>

    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=path %>/resource/bootstrap-3.3.5/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="<%=path %>/resource/bootstrap-3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/bootstrap-3.3.5/js/bootstrap-modal.js"></script>

    <!-- validator -->
    <link rel="stylesheet" href="<%=path%>/resource/validator/jquery.validator.css">
    <script type="text/javascript" src="<%=path%>/resource/validator/jquery.validator.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/validator/local/zh-CN.js"></script>

    <!-- jcrop -->
    <link rel="stylesheet" href="<%=path %>/resource/jcrop/css/jquery.Jcrop.css" type="text/css">
    <script type="text/javascript" src="<%=path %>/resource/jcrop/js/jquery.Jcrop.js"></script>

    <!-- ace -->
    <link rel="stylesheet" href="<%=path %>/resource/ace/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=path %>/resource/ace/css/ace.min.css" type="text/css">
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=path %>/resource/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="<%=path %>/resource/ace/js/ace.min.js"></script>
    <script src="<%=path %>/resource/ace/js/ace-extra.min.js"></script>


    <link rel="stylesheet" href="<%=path%>/resource/css/manageBase.css">

    <!-- metisMenu -->
    <script src="<%=path %>/resource/metisMenu/metisMenu.min.js"></script>


    <!-- zTree树插件 -->
    <link rel="stylesheet" href="<%=path %>/resource/zTree3.5/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="<%=path %>/resource/zTree3.5/js/jquery.ztree.all-3.5.min.js"></script>


    <!-- kindeditor富文本编辑器 -->
    <link rel="stylesheet" href="<%=path %>/resource/kindeditor/themes/default/default.css"/>
    <script charset="utf-8" src="<%=path %>/resource/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="<%=path %>/resource/kindeditor/lang/zh-CN.js"></script>



</head>
