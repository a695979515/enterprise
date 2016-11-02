<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page info="招聘管理"%>
<%

	Map<String,String> natures = new LinkedHashMap<String,String>();
	natures.put("0","全职");
	natures.put("1","兼职");
	
	Map<String,String> educations = new LinkedHashMap<String,String>();
	educations.put("0","不限");
	educations.put("1","高中");
	educations.put("2","专科");
	educations.put("3","本科");
	
	Map<String,String> experiences = new LinkedHashMap<String,String>();
	experiences.put("0","不限");
	experiences.put("1","1年");
	experiences.put("2","2年");
	experiences.put("3","3年");
	experiences.put("4","4年");
	experiences.put("5","5年");
	experiences.put("6","6年");
	experiences.put("7","7年");
	experiences.put("8","8年");
	experiences.put("9","9年");
	experiences.put("10","10年");
	
	
	Map<String,String> statuss = new LinkedHashMap<String,String>();
	statuss.put("y","显示");
	statuss.put("n","不显示");
%>
<form action="<%=path %>/manage/recruitment" name="form" id="form" method="post">
	<div style="height:auto!important;height:550px;min-height:550px;">
		<h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
			<%=getServletInfo()%>
			<a href="<%=path %>/manage/recruitment/selectList" class="btn btn-primary"
			   style="padding: 2px 15px;float:right;"><i class="icon-double-angle-left"></i>返回列表</a>
		</h3>
<table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">


			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" value="${e.id}" name="id" label="id" /></td>
			</tr>
		
			<tr>
				<th style="text-align: right;width: 120px;">招聘职位：</th>
				<td style="text-align: left;" colspan="3"><input type="text" value="${e.position}" name="position"  size="40"   id="position"
				data-rule="职位:required;position;length[1~45];"/></td>
			</tr>
			<tr>
				<th style="text-align: right;">招聘人数：</th>
				<td style="text-align: left;" colspan="3">
					<input type="text" value="${e.number}" name="number"  size="4" id="number" data-rule="人数:required;integer[+];">人
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">工作性质：</th>
				<td style="text-align: left;width: 200px;">
					<select name="nature">
					 <c:forEach var="entry" items="<%=natures %>">
						<option value="${entry.key}" <c:if test="${e.nature eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
					 </c:forEach>
					</select>
				</td>
				<th style="text-align: right;width: 120px;">工作经验：</th>
				<td style="text-align: left;">

					<select name="experience">
						<c:forEach var="entry" items="<%=experiences %>">
							<option value="${entry.key}" <c:if test="${e.experience eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
						</c:forEach>
					</select>
					及以上
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">学历要求：</th>
				<td style="text-align: left;">
					<select name="education">
						<c:forEach var="entry" items="<%=educations %>">
							<option value="${entry.key}" <c:if test="${e.education eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
						</c:forEach>
					</select>
					及以上
				</td>
				<th style="text-align: right;">招聘状态：</th>
				<td style="text-align: left;">
					<select name="status">
						<c:forEach var="entry" items="<%=statuss %>">
							<option value="${entry.key}" <c:if test="${e.status eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">职位要求：</th>
				<td style="text-align: left;" colspan="3">
					<textarea name="requirements" style="width:100%;height:400px;visibility:hidden;" id="requirements"
					data-rule="内容:required;requirements;">${e.requirements}</textarea>
				</td>
			</tr>
	<tr>
		<td colspan="4" style="text-align: center;">
			<c:choose>
				<c:when test="${e.id == 0}">
					<button method="insert" class="btn btn-info" style="padding:2px 15px;" onclick="return selectList(this)">
						新增
					</button>
				</c:when>
				<c:otherwise>
					<button method="update" class="btn btn-info" style="padding:2px 15px;" onclick="return selectList(this)">
						保存
					</button>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
		</table>
		</div>
	</form>
<script type="text/javascript">
function selectList(obj){
	var tableId = $(obj).attr("table-id");
	var table;
	if(tableId && (table=$("#"+tableId).DataTable({"retrieve":true}))) {
		table.on('preXhr.dt', function ( e, settings, data ) {
			$.each($("form").serializeArray(),function(ix,v){
				data[v.name]= v.value;
			});
		} );
		table.ajax.reload();
		return false;
	}
	var _form = $("form");
	_form.attr("action",$(obj).attr("method"));
	_form.submit();
}
</script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="requirements"]', {
			filterMode : false,
			uploadJson : '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
		});
		
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=isEmpty]').click(function(e) {
			alert(editor.isEmpty());
		});
		K('input[name=getText]').click(function(e) {
			alert(editor.text());
		});
		K('input[name=selectedHtml]').click(function(e) {
			alert(editor.selectedHtml());
		});
		K('input[name=setHtml]').click(function(e) {
			editor.html('<h3>Hello KindEditor</h3>');
		});
		K('input[name=setText]').click(function(e) {
			editor.text('<h3>Hello KindEditor</h3>');
		});
		K('input[name=insertHtml]').click(function(e) {
			editor.insertHtml('<strong>插入HTML</strong>');
		});
		K('input[name=appendHtml]').click(function(e) {
			editor.appendHtml('<strong>添加HTML</strong>');
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>