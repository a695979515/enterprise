<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="网站管理员" %>


    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="<%=path %>/manage/user/toAdd" class="btn btn-primary"
               style="padding: 2px 15px;float:right;"><i class="icon-plus "></i>添加管理员</a>
        </h3>

        <table class="table table-bordered table-hover table-striped">
            <tr >
                <th>登录帐号</th>
                <th>管理员名称</th>
                <th>创建时间</th>
                <th>邮箱</th>
                <th nowrap="nowrap">操作</th>
            </tr>
            <c:forEach var="item" items="${pager.list}">
                <tr>
                    <td>${item.username}</td>
                    <td>${item.nickname}</td>
                    <td>${item.createtime}</td>
                    <td>${item.email}</td>
                    <td><a href="toEdit?id=${item.id}">编辑</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="71" style="text-align: center;">
                    <%@ include file="/manage/system/page.jsp" %>
                </td>
            </tr>
        </table>
    </div>

<%@ include file="/manage/system/baseFoot.jsp" %>