<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/manage/system/htmlBase.jsp" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            $('#alert-success').alert("close");
            $('#alert-warning').alert("close");
            $('#alert-danger').alert("close");
        }, 3000);
    });
</script>
<body>
<div class="navbar navbar-default" id="navbar">
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="<%=path %>/manage/user/home" class="navbar-brand" style="height: 45px;">
                <small>
                    <i class="icon-leaf"></i>
                    <%=SystemManage.getInstance().getSystemSetting().getName() %> - 后台管理系统
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <%if (u != null) {
                          if(u.getPortrait()!=null){
                        %>
                        <img class="nav-user-photo" src="<%=path%>/<%=u.getPortrait()%>"/>
                        <%}else{%>
                        <img class="nav-user-photo" src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %>/resource/images/portrait.jpg"/>
                        <%}}%>
								<span class="user-info">
									<small>欢迎光临,</small>
									<%if (u != null) { %> <%=u.getNickname() %> <%} %>
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="<%=path %>/manage/user/toEdit?id=<%if (u != null) { %> <%=u.getId() %> <%} %>">
                                <i class="icon-cog"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a href="<%=path %>/manage/user/info?id=<%if(u!=null){ %><%=u.getId() %><%} %>">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="<%=path %>/manage/user/logout">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <%@include file="/manage/system/menu.jsp" %>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
        </div>
        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb" style="line-height: 40px;">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="<%=path %>/manage/user/home">首页</a>
                    </li>
                    <li class="active"><%=getServletInfo()%></li>
                </ul><!-- .breadcrumb -->

            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">