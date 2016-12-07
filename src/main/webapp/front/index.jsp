<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<style>
    .banners_li {
        width: 33.33%;
        text-align: left;
    }
    ul li {
        /* box-sizing: border-box; */
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
<div style="padding: 130px 0px;width: 1240px;margin:0 auto;">
    <ul>
        <li class="banners_li">
            <a>
                <div>
                    <h3>测试文字</h3>
                    <p>测试文字测试文字测试文字</p>
                </div>
            </a>
        </li>
        <li class="banners_li">
            <a>
                <div>
                    <h3>测试文字</h3>
                    <p>测试文字测试文字测试文字</p>
                </div>
            </a>
        </li>
        <li class="banners_li banners_li_last">
            <a>
                <div>
                    <h3>测试文字</h3>
                    <p>测试文字测试文字测试文字</p>
                </div>
            </a>
        </li>
    </ul>
</div>
<%@include file="/front/common/foot.jsp" %>

