<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="友情链接"%>

<%	Map<String,String> targets = new LinkedHashMap<String,String>();
	targets.put("_blank","新窗口打开");
	targets.put("_self","当前页面跳转");
%>
<form action="<%=path %>/manage/friendLinks"  name="form" id="form" method="post">
	<div style="height:auto!important;height:550px;min-height:550px;">
		<h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
			<%=getServletInfo()%>
			<a href="<%=path %>/manage/friendLinks/selectList" class="btn btn-primary"
			   style="padding: 2px 15px;float:right;"><i class="icon-double-angle-left"></i>返回列表</a>
		</h3>
		<table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">

			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" value="${e.id}" name="id" label="id" /></td>
			</tr>
			<tr>
				<th style="text-align: right;" width="200">名称</th>
				<td style="text-align: left;"><input type="text"  size="40"  value="${e.name}" name="name"  data-rule="名称:required;name;length[1~45];"
						id="name" /></td>
			</tr>
			<tr>
				<th style="text-align: right;">地址</th>
				<td style="text-align: left;"><input type="text"  size="40" value="${e.url}" name="url"  data-rule="地址:required;url;length[1~70];"
						id="url" /><br>
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">打开方式</th>
				<td style="text-align: left;">
					<select name="target">
						<c:forEach var="entry" items="<%=targets %>">
							<option value="${entry.key}" <c:if test="${e.target eq entry.key }">selected="selected"</c:if> >${entry.value}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<c:choose>
						<c:when test="${e.id!=0}">
							<button method="update" onclick="commit(this)" class="btn btn-info" style="padding:2px 15px;">
	                            保存
	                        </button>
						</c:when>
						<c:otherwise>
							<button method="insert" onclick="commit(this)" class="btn btn-info" style="padding:2px 15px;">
                            	新增
                        </button>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		</div>
	</form>
<script type="text/javascript">
function commit(obj){
	
	var _form = $("form");
	_form.attr("action",$(obj).attr("method"));
	_form.submit();
}
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>