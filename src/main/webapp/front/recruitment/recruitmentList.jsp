<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/17
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.LinkedHashMap" %>
<%
    Map<String,String> natures = new LinkedHashMap<String,String>();
    natures.put("0","全职");
    natures.put("1","兼职");

    Map<String,String> educations = new LinkedHashMap<String,String>();
    educations.put("0","不限");
    educations.put("1","高中");
    educations.put("2","专科");
    educations.put("3","本科");

    Map<String,String> experiences = new LinkedHashMap<String,String>();
    experiences.put("0","不限");
    experiences.put("1","1年");
    experiences.put("2","2年");
    experiences.put("3","3年");
    experiences.put("4","4年");
    experiences.put("5","5年");
    experiences.put("6","6年");
    experiences.put("7","7年");
    experiences.put("8","8年");
    experiences.put("9","9年");
    experiences.put("10","10年");
%>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner.jpg)">

</div>
<div class="warp_main">
    <div class="warp_left">
        <div class="warp_left_box">
            <h3>诚聘英才</h3>

        </div>
    </div>
    <div class="warp_right">
        <div class="breadcrumb">
            <a href="<%=path%>/index">首页</a>
            >
            <a href="<%=path%>/recruitment">诚聘英才</a>
        </div>
        <div style="overflow: hidden;">
            <div class="article_content">
                <c:forEach var="item" items="<%=SystemManage.getInstance().getRecruitments()%>">
                    <div class="recruitmentList">
                        <p><span style="background-color: #ff0000;
    font-family: 微软雅黑, microsoft yahei;
    color: #ffffff;
    font-size: 16px;">${item.position}</span></p>
                            <p>工作性质：
                                <c:forEach var="natures" items="<%=natures%>">
                                   <c:if test="${item.nature eq natures.key }">
                                       ${natures.value}
                                   </c:if>
                                </c:forEach>
                            </p>
                        <p>招聘人数：${item.number}人</p>
                        <p>学历要求：
                            <c:forEach var="educations" items="<%=educations%>">
                                <c:if test="${item.education eq educations.key }">
                                    ${educations.value} 及以上
                                </c:if>
                            </c:forEach>
                        </p>
                        <p>工作经验：
                            <c:forEach var="experiences" items="<%=experiences%>">
                                <c:if test="${item.experience eq experiences.key }">
                                    ${experiences.value} 及以上
                                </c:if>
                            </c:forEach>
                        </p>
                          <p> 职位要求：<br> ${item.requirements}</p>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
</div>


<%@include file="/front/common/foot.jsp"%>