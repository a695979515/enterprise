<%@ page import="com.enterprise.entity.ArticleCategory" %>

<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/15
  Time: 9:41
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
            <h3>新闻动态</h3>
            <ul>
                <c:forEach var="item" items="<%=SystemManage.getInstance().getArticleCategory()%>">
                    <li <c:if test="${!empty code && code eq item.code}">class="active"</c:if> ><a href="<%=path%>/article/${item.code}">${item.catename}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="warp_right">
        <div class="breadcrumb">
            <a href="<%=path%>/index">首页</a>
            >
            <a href="<%=path%>/article">新闻动态</a>
          <%
                String code = (String)request.getAttribute("code");
                if (code != null && code.length() != 0 ) {
                    for (ArticleCategory ac : SystemManage.getInstance().getArticleCategory()) {
                        if ((ac.getCode()).equals(code)) {
            %>
            ><a href="<%=path%>/article/<%=ac.getCode()%>"><%=ac.getCatename()%>
        </a>
            <%
                            break;
                        }
                    }
                }
            %>
        </div>
        <div style="overflow: hidden;">
            <c:forEach var="item" items="${pager.list}">
                <div class="article_item">
                    <h2><a href="<%=path%>/article/${item.id}">${item.title}</a></h2>
                    <p class="article_item_message">
                            ${item.createtime} | 分类：${item.catename} | 浏览量：${item.hit}
                    </p>
                    <a href="article/${item.id}"><span>${item.description}…</span></a>
                </div>
            </c:forEach>
        </div>
        <div style="margin-top: 20px;">
            <%@include file="/front/common/page.jsp" %>
        </div>
    </div>
</div>


<%@include file="/front/common/foot.jsp" %>
