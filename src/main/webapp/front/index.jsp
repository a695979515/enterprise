<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<style>
    .banners{
        padding: 130px 0px;width: 1240px;margin:0 auto;
    }
    .banners_li {
        width: 33.33%;
        text-align: left;
    }
    .banners ul li {
        box-sizing: border-box;
        float: left;

    }
    .banners_li a {
        display: block;
        text-align: center;
        border-right: 1px solid #E1E1E1;
    }
    a{
        text-decoration: none;
        color: #000000;
    }
    .banners_li a div {
        display: inline-block;
        cursor: pointer;
        zoom: 1;
    }
    .banners_li a h3 {
        font-size: 20px;
        color: #333333;
        line-height: 28px;
        text-align: left;
        cursor: pointer;
    }
    .banners_li a p {
        font-size: 14px;
        color: #939393;
        line-height: 28px;
        text-align: left;
        cursor: pointer;
    }
    .banners_li_last a {
        border-right: none;
    }
</style>

<body>
<%@include file="/front/common/navigation.jsp" %>
<%@include file="/front/common/indexSlide.jsp" %>
<div class="banners" >
    <ul>
        <li class="banners_li">
            <a href="<%=path%>/service">
                <div>
                    <h3>服务领域</h3>
                    <p>别墅装修，校区装修</p>
                </div>
            </a>
        </li>
        <li class="banners_li">
            <a href="<%=path%>/article">
                <div>
                    <h3>新闻动态</h3>
                    <p>公司动态，行业新闻</p>
                </div>
            </a>
        </li>
        <li class="banners_li banners_li_last">
            <a href="<%=path%>/about">
                <div>
                    <h3>关于我们</h3>
                    <p>了解我们，了解华宇</p>
                </div>
            </a>
        </li>
    </ul>
</div>
<%@include file="/front/common/foot.jsp" %>

