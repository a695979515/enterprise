<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/7
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="数据备份" %>
<div style="height:auto!important;height:550px;min-height:550px;">
    <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
        <%=getServletInfo()%>
        <a href="<%=path %>/manage/backups/backupsList" class="btn btn-primary"
           style="padding: 2px 15px;float:right;"><i class=" icon-cloud"></i>备份数据</a>
    </h3>
    <table class="table table-bordered table-hover table-striped">
        <tr>
            <th>文件名</th>
            <th width="100">大小</th>
            <th width="250">最后修改时间</th>
            <th width="200">操作</th>
        </tr>
        <c:forEach var="item" items="${recoverList}">
            <tr>
                <td>${item.fileName}</td>
                <td>${item.size}</td>
                <td>${item.createtime}</td>
                <td><a style="cursor: pointer;" onclick="return recovers('${item.fileName}','确定恢复选择的备份文件吗？');">恢复</a> |
                    <a style="cursor: pointer;" onclick=" downloadsql('${item.fileName}');">下载 </a>|
                    <a style="cursor: pointer;" onclick="return deletesql('${item.fileName}','确定删除备份文件吗？');">删除</a>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
<script type="text/javascript">

    function recovers(obj, tip) {
        var _url = "<%=path%>/manage/backups/recover";
        if (confirm(tip)) {
            $.ajax({
                type: 'post',
                url: _url,
                data: {'fileName': obj},
                dataType: "json",
                success: function (data) {
                    alert("恢复成功！");
                },
                error: function () {
                    alert("操作失败，请联系管理员或更换浏览器再试!");
                }
            });
        }
    }
    function downloadsql(data){
        var _url = "<%=path%>/manage/backups/downloadSql?fileName="+data;
        window.open(_url);
        return false;
    }
    function deletesql(data,tip){
        if (confirm(tip)) {
            var _url = "<%=path%>/manage/backups/deleteRecover?fileName=" + data;
            location.href = _url;
        }
    }
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>
