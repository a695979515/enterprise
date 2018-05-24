<%@ page import="com.enterprise.entity.Service" %><%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/17
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner.jpg)">

</div>
<div class="warp_main">
    <div class="warp_left">
        <div class="warp_left_box">
            <h3>服务领域</h3>
            <ul>
                <c:forEach var="item" items="<%=SystemManage.getInstance().getService()%>">
                    <li <c:if test="${!empty id && id eq item.id}">class="active"</c:if> ><a href="<%=path%>/service/${item.id}">${item.title}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="warp_right">
        <div class="breadcrumb">
            <a href="<%=path%>/index">首页</a>
            >
            <a href="<%=path%>/service">服务领域</a>
            <%
                String id = (String)request.getAttribute("id");
                    for (Service ac : SystemManage.getInstance().getService()) {
                        if ((String.valueOf(ac.getId())).equals(id)) {
            %>
            ><a href="<%=path%>/service/<%=ac.getId()%>"><%=ac.getTitle()%>
        </a>
            <%
                            break;
                        }
                }
            %>
        </div>
        <div style="overflow: hidden;">
            <div class="article_content">
                <%
                    for (Service ac : SystemManage.getInstance().getService()) {
                        System.out.println(id);
                        if ((String.valueOf(ac.getId())).equals(id)) {
                %>
                        <%=ac.getContentHtml()%>
                <%
                            break;
                        }else{%>
                <%=ac.getContentHtml()%>
                <% break;
                            }
                    }
                %>
            </div>
        </div>
    </div>
</div>


<%@include file="/front/common/foot.jsp"%>