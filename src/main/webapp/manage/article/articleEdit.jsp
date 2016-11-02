<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/14
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="文章列表" %>
<%
    Map<String,String> statuss = new LinkedHashMap<String,String>();
    statuss.put("y","显示");
    statuss.put("n","不显示");
%>
<form action="<%=path %>/manage/article" name="form" id="form" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="<%=path %>/manage/article/selectList" class="btn btn-primary"
               style="padding: 2px 15px;float:right;"><i class="icon-double-angle-left"></i>返回列表</a>
        </h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">

            <tr style="display: none;">
                <td>id</td>
                <td><input type="hidden" value="${e.id}" name="id" label="id"/></td>
            </tr>
            <tr>
                <th style="text-align: right;" width="200">文章标题</th>
                <td style="text-align: left;"><input type="text" size="40" value="${e.title}" name="title"
                                                     data-rule="文章标题:required;title;length[1~45];"
                                                     id="title"/></td>
            </tr>
            <tr>
                <th style="text-align: right;">文章分类</th>
                <td style="text-align: left;">
                    <select id="categoryId" name="categoryId">
                        <c:forEach var="item" items="<%=SystemManage.getInstance().getArticleCategory()%>">
                            <option value="${item.id}" <c:if test="${e.categoryId eq item.id}">selected="selected" </c:if>>${item.catename}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;">缩略图</th>
                <td style="text-align: left;"><input type="text"  size="40"
                                                     id="image" name="image" value="${e.image}"
                />
                    <input type="button" name="imageFile" value="选择图片" class="btn btn-primary" style="padding: 0px 12px;margin-top: -5px;"/>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;">关键字</th>
                <td style="text-align: left;"><input type="text" size="80" value="${e.keywords}" name="keywords"
                                                     id="keywords"/></td>
            </tr>
            <tr>
                <th style="text-align: right;">状态</th>
                <td style="text-align: left;">
                    <select name="status">
                        <c:forEach var="entry" items="<%=statuss %>">
                            <option value="${entry.key}" <c:if test="${e.status eq entry.key}">selected="selected" </c:if>>${entry.value}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;">文章描述</th>
                <td style="text-align: left;">
                    <textarea id="description" name="description" class="textArea" cols="120"  data-rule="description;length[1~300];"
                              rows="4">${e.description}</textarea>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;">文章内容</th>
                <td style="text-align: left;">
                    <textarea name="content" id="content" data-rule="文章内容:required;"
                              style="width:850px;height:400px;visibility:hidden;">${e.content}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <c:choose>
                        <c:when test="${e.id!=0}">
                            <button method="update" onclick="commit(this)" class="btn btn-info"
                                    style="padding:2px 15px;">
                                保存
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button method="insert" onclick="commit(this)" class="btn btn-info"
                                    style="padding:2px 15px;">
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

    var content;
    KindEditor.ready(function (K) {
        content = K.create('textarea[name="content"]', {
            filterMode: false,
            allowFileManager: true,
            uploadJson: '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
            fileManagerJson: '<%=path%>/resource/kindeditor/jsp/file_manager_json.jsp'

        });
        var editor = K.editor({
            allowFileManager : true,
            uploadJson: '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : '<%=path%>/resource/kindeditor/jsp/file_manager_json.jsp'
        });

        K('input[name=getHtml]').click(function (e) {
            alert(editor.html());
        });
        K('input[name=isEmpty]').click(function (e) {
            alert(editor.isEmpty());
        });
        K('input[name=getText]').click(function (e) {
            alert(editor.text());
        });
        K('input[name=selectedHtml]').click(function (e) {
            alert(editor.selectedHtml());
        });
        K('input[name=setHtml]').click(function (e) {
            editor.html('<h3>Hello KindEditor</h3>');
        });
        K('input[name=setText]').click(function (e) {
            editor.text('<h3>Hello KindEditor</h3>');
        });
        K('input[name=insertHtml]').click(function (e) {
            editor.insertHtml('<strong>插入HTML</strong>');
        });
        K('input[name=appendHtml]').click(function (e) {
            editor.appendHtml('<strong>添加HTML</strong>');
        });
        K('input[name=imageFile]').click(function() {
            editor.loadPlugin('image', function() {
                editor.plugin.imageDialog({
                    imageUrl : K('#image').val(),
                    clickFn : function(url) {
                        K('#image').val(url);
                        editor.hideDialog();
                    }
                });
            });
        });
        K('input[name=clear]').click(function (e) {
            editor.html('');
        });

    });
    function commit(obj) {
        content.sync();
        var _form = $("form");
        _form.attr("action", $(obj).attr("method"));
        _form.submit();
    }
</script>


<%@ include file="/manage/system/baseFoot.jsp" %>
