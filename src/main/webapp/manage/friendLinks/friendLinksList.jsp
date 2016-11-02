<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="友情链接" %>
<form action="<%=path%>/manage/friendLinks" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="toAdd" class="btn btn-primary"
               style="padding: 2px 15px;float:right;">
                <i class="icon-plus "></i>添加链接
            </a>
        </h3>
        <div class="filter">
            <button method="deletes" class="btn btn-danger" style="padding:0px 5px;margin-top: -4px;" onclick="return submitIDs(this,'确定删除选择的友情链接信息?');">
                <i class="icon-trash"></i>删除
            </button>
        </div>


        <table class="table table-bordered table-hover table-striped">
            <tr >
                <th width="20"><input type="checkbox" id="firstCheckbox"/></th>
                <th>名称</th>
                <th>链接</th>
                <th>打开方式</th>
                <th nowrap="nowrap">操作</th>
            </tr>
            <c:forEach var="item" items="${pager.list}">
                <tr>
                    <td><input type="checkbox" name="ids"
                               value="${item.id}"/></td>
                    <td><a href="${item.url}" target="_blank">${item.name}</a></td>
                    <td>${item.url}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.target eq '_blank'}">
                                新窗口打开
                            </c:when>
                            <c:otherwise>
                                当前页面跳转
                            </c:otherwise>
                        </c:choose>

                    </td>
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
</form>
<script type="text/javascript">
    $(function () {
        $("#firstCheckbox").on("click", function () {
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