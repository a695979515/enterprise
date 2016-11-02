<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page info="招聘管理" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.LinkedHashMap" %>
<% Map<String, String> types = new LinkedHashMap<String, String>();
    types.put("", "全部");
    types.put("y", "显示");
    types.put("n", "不显示");
%>
<form action="<%=path%>/manage/recruitment" method="post" id="form" name="form">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="toAdd" class="btn btn-primary"
               style="padding: 2px 15px;float:right;">
                <i class="icon-plus "></i>添加招聘
            </a>
        </h3>
        <div class="filter">
            <div style="float: left">
                <button method="deletes" class="btn btn-danger" style="padding:0px 5px;margin-top: -4px;" onclick="return submitIDs(this,'确定删除选择的招聘信息?');">
                    <i class="icon-trash"></i>删除
                </button>

                <button method="updateStatusY" class="btn btn-info" style="padding:0px 5px;margin-top: -4px;"
                        onclick="return submitIDs(this,'确定让选择的招聘信息显示?选择的招聘信息将会出现在门户页面上。');">
                    <i class="icon-eye-open"></i>显示
                </button>

                <button method="updateStatusN" class="btn btn-default" style="padding:0px 5px;margin-top: -4px;"
                        onclick="return submitIDs(this,'执行该操作后,选择的招聘信息将不会出现在门户页面上。确定要执行?');">
                    <i class="icon-eye-close"></i>不显示
                </button>
            </div>

            <div style="float: right;">
                <select id="status" name="status" class="input-medium" style="width:100px;">
                    <c:forEach var="entry" items="<%=types %>">
                        <option value="${entry.key}"
                                <c:if test="${e.status eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
                    </c:forEach>
                </select>
                <input type="text" value="${e.position}" class="input-medium search-query" name="position"
                       placeholder="职位"/>
                <button method="selectList" class="btn btn-info" style="padding:0px 5px;margin-top: -4px;"
                        onclick="selectList(this)">
                    <i class="icon-search"></i>查询
                </button>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <th width="20px"><input type="checkbox" id="firstCheckbox"/></th>
                <th>职位</th>
                <th>工作性质</th>
                <th>招聘人数</th>
                <th>创建人</th>
                <th>创建时间</th>
                <th width="80px;">显示状态</th>
                <th width="60px;">操作</th>
            </tr>

            <c:forEach var="item" items="${pager.list}">
                <tr>
                    <td><input type="checkbox" name="ids"
                               value="${item.id}"/></td>
                    <td nowrap="nowrap">${item.position}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.nature eq '0'}">
                                全职
                            </c:when>
                            <c:otherwise>
                                兼职
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${item.number}人</td>
                    <td>${item.createAccount}</td>
                    <td>${item.createtime}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.status eq 'y'}">
                                <i class="icon-ok"></i>
                            </c:when>
                            <c:otherwise>
                                <i class="icon-remove"></i>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="toEdit?id=${item.id}">编辑</a>
                    </td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="17" style="text-align: center;font-size: 12px;">
                    <%@ include file="/manage/system/page.jsp" %>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(function () {
        $("#firstCheckbox").on("click", function () {
            console.log("check=" + $(this).prop("checked"));
            if ($(this).prop("checked")) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        });
    });
    function submitIDs(obj, tip) {
        if ($("input:checked").size() == 0) {
            alert("请先选择要操作的内容！");
            return false;
        }

        if (confirm(tip)) {
            //createMark();
            var _form = $("form");
            _form.attr("action", $(obj).attr("method"));
            _form.submit();
        }
        return false;
    }
    //查询
    function selectList(obj) {

        var _form = $("form");
        _form.attr("action", $(obj).attr("method"));
        _form.submit();
    }
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>