<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="留言管理" %>

<style>
    table {
        table-layout: fixed; /* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
        width:100%;
    }

    td {
        word-break: keep-all; /* 不换行 */
        white-space: nowrap; /* 不换行 */
        overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
        text-overflow: ellipsis; /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/
    }

</style>

    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>

        </h3>
        <table class="table table-bordered table-hover table-striped" >
            <tr >
                <th width="10%">标题</th>
                <th width="8%">姓名</th>
                <th width="8%">联系电话</th>
                <th width="4%">性别</th>
                <th width="12%">电子邮箱</th>
                <th width="13%">留言时间</th>
                <th width="40%">留言内容</th>
                <th width="5%">操作</th>
            </tr>
            <c:forEach var="item" items="${pager.list}">
                <tr>

                    <td>${item.title}</td>
                    <td>${item.name}</td>
                    <td>${item.tel}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.gender eq 'f'}">
                                女
                            </c:when>
                            <c:otherwise>
                                男
                            </c:otherwise>
                        </c:choose>

                    </td>
                    <td>${item.email}</td>
                    <td>${item.leavetime}</td>
                    <td title="${item.content}">${item.content}</td>
                    <td><a href="toEdit?id=${item.id}">查看</a></td>
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