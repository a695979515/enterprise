<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page info="日志管理" %>
<%	Map<String,String> types = new HashMap<String,String>();
    types.put("","全部");
    types.put("y","是");
    types.put("n","否");
%>
<form action="<%=path %>/manage/systemlog" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
        </h3>
        <div class="filter">
            <div style="float: right">
            <select id="diffAreaLogin" name="diffAreaLogin">
                <c:forEach var="entry" items="<%=types %>">
                    <option value="${entry.key}" <c:if test="${e.diffAreaLogin eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
                </c:forEach>
            </select>
            <input type="text" value="${e.account}" class="input-medium search-query" name="account" placeholder="管理员帐号"/>
                <button method="selectList" class="btn btn-info" style="padding:0px 5px;margin-top: -4px;"
                        onclick="selectList(this)">
                    <i class="icon-search"></i>查询
                </button>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <tr >
                <th>标题</th>
                <th>管理员帐号</th>
                <th>登录时间</th>
                <th>登录IP</th>
                <th>登录位置</th>
                <th >是否异地登录</th>
            </tr>
            <c:forEach var="item" items="${pager.list}">
                <tr>
                    <td>${item.title}</td>
                    <td>${item.account}</td>
                    <td>${item.logintime}</td>
                    <td>${item.loginIp}</td>
                    <td>${item.loginArea}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.diffAreaLogin eq 'y'}">
                                是
                            </c:when>
                            <c:otherwise>
                                否
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="71" style="text-align: center;">
                    <%@ include file="/manage/system/page.jsp" %>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">


    //查询
    function selectList(obj) {

        var _form = $("form");
        _form.attr("action", $(obj).attr("method"));
        _form.submit();
    }
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>