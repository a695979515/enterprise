<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/manage/system/htmlBase.jsp" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.LinkedHashMap" %>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
  <%
  	Map<String, String> types = new LinkedHashMap<String, String>(); 
  	types.put("module","模块");
  	types.put("page","页面");
  	types.put("button","按钮");
  %> 
  <SCRIPT type="text/javascript">
		$(function(){
			
	 		//$("#add").add("#update").click(function(){
	 			//art.dialog.open('${basepath}/menu!toEdit.action',
	 				//	{title: '个人信息',width:500, height:350,lock:true});	 			
	 			//art.dialog.load('./ajaxContent/login.html', false);
	 			//art.dialog.open('', {title: '提示'});
	 		//});
	 		$("#input_menu_name").focus();
	 		
	 		$('input:radio[name="parentOrChildRadio"]').click(function(){
	 			var parentOrChild =$(this).val();//子菜单还是根节点
	 			if(parentOrChild==0 || parentOrChild==1){
	 				//添加顶级菜单
	 				$("#result_table1").hide();
	 			}else{
	 				$("#result_table1").show();
	 			}
	 		});
	 		
	 		//添加子菜单/修改父菜单
	 		$("#add").click(function(){
	 			var id = $("#input_menu_id").val();
	 			var name = $("#input_menu_name").val();
	 			var url = $("#input_menu_url").val();
	 			var orderNum = $("#input_menu_orderNum").val();
	 			var type = $("#input_menu_type").val();
				var icon = $("#input_menu_icon").val();
	 			
	 			var n_name = $("#input_new_menu_name").val();
	 			var n_url = $("#input_new_menu_url").val();
	 			var parentOrChild =$('input:radio[name="parentOrChildRadio"]:checked').val();//子菜单还是根节点
	 			var n_orderNum = $("#input_new_menu_level").val();
	 			var n_type = $("#input_new_menu_type").val();
	 			
	 			$.ajax({
					url:"<%=path%>/manage/menu/addOrUpdate",
					type:"post",
					data:{
						updateP:2,//-1不修改父菜单，1修改
						//父菜单信息
						id:id,
						name:name,
						url:url,
						orderNum:orderNum,
						type:type,
						icon:icon,
						
						//子菜单信息
						n_name:n_name,
						n_url:n_url,
						parentOrChild:parentOrChild,
						n_orderNum:n_orderNum,
						n_type:n_type
					},
					dataType:"text",
					success:function(data, textStatus){
						$("#showMsgDiv").html("修改资源菜单成功!");
						
						setTimeout(function(){$("#showMsgDiv").html("");},2000);
					},
					error:function(){
						alert("修改资源菜单失败!");
					}
				});
	 		});
	 		
		});
	</SCRIPT>        
  <form action="<%=path%>/manage/menu" name="form1" method="post" >         

<div id="contians_div" style="text-align: right; border: 0px ; margin: auto;">
			<div id="context_div" style="margin-top: 20px;">
			
			<div id="showMsgDiv" style="text-align: center;"></div>
	<table id="result_table1" class="table table-bordered" style="width: 500px;margin: auto;margin-top: 20px;">
	<tr>
			<td colspan="2" style="background-color: #dff0d8;text-align: center;">
				<strong>当前选中的菜单</strong>
			</td>
		</tr>
		<tr style="display: none;">
			<td>id</td>
			<td>
				<input id="input_menu_id" name="id" readonly="readonly" value='${e.id}'/>
			</td>
		</tr>
		<tr style="display: none;">
			<td>pid</td>
			<td>
				<input id="input_menu_pid" name="pid" readonly="readonly" value='${e.pid}'/>
			</td>
		</tr>
		<tr>
			<th>名称</th>
			<td style="text-align: left;">
				<input type="text" name="name" id="input_menu_name" size="60" value='${e.name}'/>
			</td>
		</tr>
		<tr>
			<th>icon</th>
			<td style="text-align: left;">
				<input type="text" name="icon" id="input_menu_icon" size="60" value='${e.icon}'/>
			</td>
		</tr>
		<tr>
			<th>url</th>
			<td style="text-align: left;">
				<input type="text" name="url"  id="input_menu_url" size="80" value='${e.url}' style="width: 360px"/>
			</td>
		</tr>
		<tr>
			<th>类型</th>
			<td style="text-align: left;">
                <select id="input_menu_type" name="type" class="input-medium">
					<c:forEach var="entry" items="<%=types %>">
                        <option value='${entry.key}' <c:if test='${e.type eq entry.key}'>selected="selected" </c:if>>${entry.value}</option>
					</c:forEach>
 </select>
			</td>
		</tr>
		<tr>
			<th>顺序</th>
			<td style="text-align: left;">
				<input type="text" name="orderNum" id="input_menu_orderNum" value='${e.orderNum}'/>
				(菜单顺序从1开始，小的显示在前面)
			</td>
		</tr>
		</table>
		<!-- item -->
		
		<table id="result_table2" class="table table-bordered" style="width: 500px;margin: auto;margin-top: 20px;">
		<tr>
			<td colspan="2" style="background-color: #dff0d8;text-align: center;">
				<strong>添加菜单</strong>
				<input type="radio" name="parentOrChildRadio" value="0"/>顶级模块
				<input type="radio" name="parentOrChildRadio" value="1"/>顶级页面
				<input type="radio" name="parentOrChildRadio" value="2"/>子模块
				<input type="radio" name="parentOrChildRadio" value="3"/>子页面
				<input type="radio" name="parentOrChildRadio" value="4" checked="checked"/>功能
			</td>
		</tr>
		<tr style="display: none;">
			<td>id</td>
			<td>
				<input type="text"  id="input_new_menu_id" readonly="readonly"/>
			</td>
		</tr>
		<tr style="display: none;">
			<td>pid</td>
			<td>
				<input type="text"  id="input_new_menu_pid" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>名称</th>
			<td style="text-align: left;">
				<input type="text"  id="input_new_menu_name" size="60" />
			</td>
		</tr>
		<tr>
			<th>url</th>
			<td style="text-align: left;">
				<input type="text"  id="input_new_menu_url" size="80" style="width: 360px"/>
			</td>
		</tr>
		<tr>
			<th>类型</th>
			<td style="text-align: left;">
				<select id="input_new_menu_type">
					<option value="">--请选择--</option>
					<option value="module">模块</option>
					<option value="page">页面</option>
					<option value="button">功能</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>顺序</th>
			<td style="text-align: left;">
				<input type="text"  id="input_new_menu_level"/>(菜单顺序从1开始，小的显示在前面)
			</td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="2">
				<input type="button" id="add" value="修改或添加" class="btn btn-primary"/>
			</td>
		</tr>
	</table>
</div></div>
</form>
