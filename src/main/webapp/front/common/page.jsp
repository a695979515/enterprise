<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/17
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<style type="text/css">
    .pageLink {
        color: #4b4b4b;
        border: 1px solid #dddddd;
        padding: 4px 12px;
        text-decoration: none;
        font-size: 12px;
    }

    .selectPageLink {
        border: 1px solid #dddddd;
        padding: 4px 12px;
        color: #4b4b4b;
        background-color: #eaeaea;
        text-decoration: none;
        font-size: 12px;
    }
</style>

<div style="text-align: right; border: 0;padding: 4px 12px;height: 40px;" class="pageDiv">
    <pg:pager url="${pager.pagerUrl}" items="${pager.total}"
              export="currentPageNumber=pageNumber"
              maxPageItems="${pager.pageSize}" maxIndexPages="10" isOffset="true">

        <pg:param name="cc" />
        <pg:first>
            <a href="${pageUrl}" class="pageLink">首页</a>
        </pg:first>
        <pg:prev>
            <a href="${pageUrl}" class="pageLink">上一页</a>
        </pg:prev>
        <pg:pages>
            <c:choose>
                <c:when test="${currentPageNumber==pageNumber}">
                    <span class="selectPageLink">${pageNumber}</span>
                </c:when>
                <c:otherwise>
                    <a href="${pageUrl}" class="pageLink">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </pg:pages>
        <pg:next>
            <a href="${pageUrl}" class="pageLink">下一页</a>
        </pg:next>
        <pg:last>
            <a href="${pageUrl}" class="pageLink">尾页</a>
        </pg:last>
    </pg:pager>
</div>

