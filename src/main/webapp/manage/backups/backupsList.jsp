<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/7
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="数据备份" %>

<div style="height:auto!important;height:550px;min-height:550px;">
    <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
        <%=getServletInfo()%>
        <a href="<%=path %>/manage/backups/recoverList" class="btn btn-primary"
           style="padding: 2px 15px;float:right;"><i class=" icon-refresh"></i>恢复数据</a>
    </h3>
    <table class="table table-bordered table-hover table-striped">
        <tr>
            <th width="20"><input type="checkbox" id="firstCheckbox"/></th>
            <th>数据表名</th>
            <th width="200">描述</th>

        </tr>
        <c:forEach var="item" items="${backupList}">
            <tr>
                <td><input type="checkbox" name="tableNames"
                           value="${item.tableName}"/></td>
                <td>${item.tableName}</td>
                <td>${item.description}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="3">
                <button  class="btn btn-info" style="padding:2px 15px;" onclick="return backups(this,'确定备份选择的数据库？');">
                    确定备份
                </button>
            </td>
        </tr>
    </table>
    </div>
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
        function backups(obj, tip) {
            if ($("input:checked").size() == 0) {
                alert("请先选择要操作的数据表！");
                return false;
            }
            var tableNames =[];
            $("input:checkbox[name='tableNames']:checked").each(function(){

                tableNames.push($(this).val());
            });
            var _url = "<%=path%>/manage/backups/backups";
            if (confirm(tip)) {
                $.ajax({
                    traditional:true,
                    type: 'post',
                    url: _url,
                    data: {tableNames},
                    dataType: "json",
                    success: function(data){
                            alert("备份成功！");
                    },
                    error:function(){
                        alert("操作失败，请联系管理员或更换浏览器再试!");
                    }
                });
            }
        }
    </script>
    <%@ include file="/manage/system/baseFoot.jsp" %>
