<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page info="门户滚动图片"%>
<%
	Map<String,String> status = new HashMap<String,String>();
	status.put("y","显示");
	status.put("n","不显示");
%>
<style>
	.tableOnebor td, .tableOnebor th {
		border-right: 0px dotted #CCCCCC;
		border-bottom: 1px dotted #CCCCCC;
		padding: 5px;
	}
	td b {
		display: block;
		margin-bottom: 8px;
	}

	.formEdit {
		border: 4px solid #9FD7FF;
	}

	.active td {
		border-bottom: 4px solid #9FD7FF;
		background-color: #FFF;
	}

</style>
<form action="<%=path%>/manage/indexImg" method="post" >
	<div style="height:auto!important;height:550px;min-height:550px;">
		<h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
			<%=getServletInfo()%></h3>


			<div class="alert alert-info">
				注意：图片尺寸请参考1920*480。
			</div>



		<table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
			<tr>
				<th style="text-align: center;">添加图片</th>
				<th style="text-align: center;">图片列表</th>
			</tr>
			<tr>
				<td width="400" valign="top">
					<form action="<%=path%>/manage/indexImg" method="post">
						<table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableOnebor <c:if test="${e.id != 0}">formEdit</c:if>">
							<tr style="display: none;">
								<th>id</th>
								<td><input type="hidden" value="${e.id}" name="id" label="id" id="idd"/></td>
							</tr>
							<tr>
								<td><b>图片名称</b>
									<input type="text" value="${e.title}" size="20" name="title"  data-rule="图片名称:required;title;length[1~45];"
										   id="title" />
								</td>
							</tr>
							<tr>
								<td><b>图片</b>
									<input type="text"  value="${e.pictureUrl}" name="pictureUrl"  id="pictureUrl"  data-rule="图片地址:required;pictureUrl;" />
									<input type="button" name="filemanager" value="浏览图片" class="btn btn-primary" style="padding: 0px 12px;margin-top: -5px;"/>
									<c:choose>
										<c:when test="${!empty e.pictureUrl}">
											<a target="_blank" href="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${e.pictureUrl}">
												<img style="max-width: 50px;max-height: 50px;" alt="" src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${e.pictureUrl}">
											</a>
										</c:when>
									</c:choose>         </td>
							</tr>
							<tr>
								<td><b>链接地址</b>
									<input type="text"   size="35" value="${e.link}" name="link"  id="link"/>
							</tr>
							<tr>
								<td><b>排序</b>
									<input type="text"  value="${e.orders}" name="orders" size="20"  data-rule="排序:required;integer[+];orders;length[1~5];"
										   id="orders" />
								</td>
							</tr>
							<tr>
								<td><b>状态</b>
									<select id="status" name="status" class="input-medium">
										<c:forEach var="entry" items="<%=status%>">
											<option value="${entry.key}" <c:if test="${entry.key eq e.status}">selected="selected" </c:if>>${entry.value}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<c:choose>
										<c:when test="${e.id == 0}">
											<button method="insert" onclick="commit(this)" class="btn btn-info" style="padding: 2px 22px;">
												 新增
											</button>
										</c:when>
										<c:otherwise>
											<a class="btn btn-default" style="padding: 2px 22px;margin-left: 50px;" href="selectList" >取消</a>
											<button method="update" onclick="commit(this)" class="btn btn-info" style="padding: 2px 22px;float: right;margin-right: 50px;">
												保存
											</button>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</form>
				</td>
				<td valign="top">
					<table width="100%" border="0" cellpadding="10" cellspacing="0" class="tableOnebor">
						<tr>
							<th width="200" style="text-align:center;">图片名称</th>
							<th></th>
							<th width="50" style="text-align:center;">排序</th>
							<th width="80" style="text-align:center;">状态</th>
							<th width="100" style="text-align:center;">操作</th>
						</tr>
					<c:forEach var="item" items="${pager.list}">
						<tr <c:if test="${e.id eq item.id}">class="active"</c:if>>
							<td style="padding: 10px 10px;"><a href="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>${item.pictureUrl}" target="_blank"><img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>${item.pictureUrl}" width="200" /></a></td>
							<td>${item.title}</td>
							<td align="center">${item.orders}</td>
							<td align="center">
								<c:choose>
									<c:when test="${item.status eq 'y'}">
										<i class="icon-ok"></i>
									</c:when>
									<c:otherwise>
										<i class="icon-remove"></i>
									</c:otherwise>
								</c:choose>
							</td>
							<td align="center"><a href="toEdit?id=${item.id}">编辑</a> | <a href="delete?id=${item.id}">删除</a></td>
						</tr>
					</c:forEach>
					</table>
				</td>
			</tr>
		</table>
		</div>
</form>
<script>



function commit(obj){
	var _form = $("form");
	_form.attr("action",$(obj).attr("method"));
	_form.submit();
}


KindEditor.ready(function(K) {
	var editor = K.editor({
		allowFileManager : true,
		uploadJson: '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=path%>/resource/kindeditor/jsp/file_manager_json.jsp'
	});

	K('input[name=filemanager]').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
				imageUrl : K('#pictureUrl').val(),
				clickFn : function(url) {
					K('#pictureUrl').val(url);
					editor.hideDialog();
				}
			});
		});
	});

});
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>