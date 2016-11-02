<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="留言管理" %>
<div style="height:auto!important;height:550px;min-height:550px;">
    <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
        <%=getServletInfo()%>
        <a href="<%=path %>/manage/message/selectList" class="btn btn-primary"
           style="padding: 2px 15px;float:right;"><i class="icon-double-angle-left"></i>返回列表</a>
    </h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">

        <tr style="display: none;">
            <td>id</td>
            <td><input type="hidden" value="${e.id}" name="id" label="id"/></td>
        </tr>

        <tr>
            <th style="text-align: right;width: 150px;">留言标题</th>
            <td style="text-align: left;">${e.title}</td>
        </tr>
        <tr>
            <th style="text-align: right;">留言人姓名</th>
            <td style="text-align: left;">${e.name}</td>
        </tr>
        <tr>
            <th style="text-align: right;">性别</th>
            <td style="text-align: left;">
                <c:choose>
                    <c:when test="${e.gender eq 'm'}">
                        男
                    </c:when>
                    <c:otherwise>
                        女
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th style="text-align: right;">联系电话</th>
            <td style="text-align: left;">${e.tel }
            </td>
        </tr>
        <tr>
            <th style="text-align: right;">电子邮箱</th>
            <td style="text-align: left;">${e.email }
            </td>
        </tr>
        <tr>
            <th style="text-align: right;">留言时间</th>
            <td style="text-align: left;">${e.leavetime }
            </td>
        </tr>
        <tr>
            <th style="text-align: right;">留言内容</th>
            <td style="text-align: left;">${e.content }</td>
        </tr>
    </table>

</div>
<%@ include file="/manage/system/baseFoot.jsp" %>