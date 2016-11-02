<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/15
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="/front/common/common.jsp"%>

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
    <li <c:if test="${e.catename eq item.catename}">class="active"</c:if>><a href="<%=path%>/article/${item.code}">${item.catename}</a></li>
    </c:forEach>
            </ul>
        </div>
    </div>
    <div class="warp_right">
        <div class="breadcrumb">
            <a href="<%=path%>/index">首页</a>
            >
            <a href="<%=path%>/article">新闻动态</a>
            >
            <a href="<%=path%>/article?categoryId=${e.categoryId}">${e.catename}</a>
        </div>
        <div style="overflow: hidden;">
            <div class="article_content">
                <h1>${e.title}</h1>
                <p class="article_message">
                    ${e.createtime} | 分类：${e.catename} | 浏览量：${e.hit}
                </p>
                <br>
                <span style="font-size: 14px">
                    ${e.content}
                </span>

                <div class="bdsharebuttonbox" style="margin-top: 30px;"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
                <script>
                    with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
                </script>
                <div class="previous">上一篇：<c:choose><c:when test="${previous.id != 0}"><a href="<%=path%>/article/${previous.id}">${previous.title}</a></c:when><c:otherwise>没有了</c:otherwise></c:choose></div>
                <div class="next">下一篇：<c:choose><c:when test="${next.id != 0}"><a href="<%=path%>/article/${next.id}">${next.title}</a></c:when><c:otherwise>没有了</c:otherwise></c:choose></div>
            </div>
        </div>
    </div>
</div>


<%@include file="/front/common/foot.jsp"%>
