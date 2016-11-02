<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="后台管理人员信息"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div id="tabs">
	<div id="tabs-1">
		<div class="alert alert-info" style="margin-bottom: 2px;text-align: left;">
			<strong>后台管理人员信息：</strong>
		</div>
		<table class="table table-bordered">
					<tr style="display: none;">
						<td>id</td>
						<td><input type="hidden" value="${e.id}" name="e.id" label="id" id="id"/></td>
					</tr>
					<tr>
						<td style="text-align: right;width: 200px;vertical-align: middle;">头像</td>
						<td style="text-align: left;">
							<c:choose>
								<c:when test="${!empty e.portrait}">
									<img class="nav-user-photo" src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %>/${e.portrait}"/>
								</c:when>
								<c:otherwise>
									<img class="nav-user-photo" src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %>/resource/images/portrait.jpg"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr><tr>
						<td style="text-align: right;">管理员名称</td>
						<td style="text-align: left;">${e.nickname}</td>
					</tr>
					<tr>
						<td style="text-align: right;">登录帐号</td>
						<td style="text-align: left;">${e.username}</td>
					</tr>
					<tr>
						<td style="text-align: right;">Email地址</td>
						<td style="text-align: left;">${e.email}</td>
					</tr>

					
				</table>
	</div>
</div>


<%@ include file="/manage/system/baseFoot.jsp" %>