<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="系统设置" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<style style="text/css">
    .tab {
        border-bottom: 1px solid #60BBFF;
        font-weight: bold;
        font-size: 14px;
        height: 35px;
        overflow: hidden;
    }

    ul, ol {
        margin: 0;
        padding: 0;
    }

    .tab li {
        float: left;
        line-height: 35px;
        height: 35px;
        list-style: none;
    }

    .tab a.selected {
        background-color: #60BBFF;
        color: #FFF;
    }

    .tab a {
        display: block;
        background-color: #F9F9F9;
        padding: 0 44px;
        text-decoration: none;
        color: #999;
    }
</style>
<script type="text/javascript">
    $(function () {
        $(".idTabs").idTabs();
    });
</script>
<form action="<%=path %>/manage/systemSetting/insertOrUpdate" id="form" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
        </h3>
        <div class="idTabs">
            <ul class="tab">
                <li><a href="#tabs-1">基本设置</a></li>
                <li><a href="#tabs-2">图片设置</a></li>
                <li><a href="#tabs-3">QQ客服设置</a></li>
            </ul>
            <div class="items">
                <div id="tabs-1">
                    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
                        <tr style="display: none;">
                            <td>id</td>
                            <td><input type="hidden" name="id" value="${e.id}" id="id"/></td>
                        </tr>
                        <tr style="display: none;">
                            <td style="text-align: right;width: 100px">系统版本</td>
                            <td style="text-align: left;"><input type="text" size="80" name="version"
                                                                 value="1.0.0" id="version"
                                                                 data-rule="系统版本:required;version;length[0~100];"/>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align: right;width: 100px">系统名称</td>
                            <td style="text-align: left;"><input type="text" size="80" name="name"
                                                                 value="${e.name}"
                                                                 id="name"
                                                                 data-rule="系统名称:required;name;length[1~30];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">门户地址</td>
                            <td style="text-align: left;"><input type="text" size="80" name="www"
                                                                 value="${e.www}"
                                                                 id="www" data-rule="门户地址:required;url;length[1~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">网站标题</td>
                            <td style="text-align: left;"><input type="text" size="80" name="title"
                                                                 value="${e.title}"
                                                                 id="title"
                                                                 data-rule="网站标题:required;title;length[0~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">SEO描述</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="description" name="description"
                                       value="${e.description}" data-rule="SEO描述:required;description;length[0~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">SEO关键字</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="keywords" name="keywords"
                                       value="${e.keywords}" data-rule="SEO关键字:required;keywords;length[0~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">联系地址</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="address" name="address"
                                       value="${e.address}" data-rule="联系地址:required;address;length[0~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">联系电话</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="tel" name="tel" value="${e.tel}" data-rule="tel;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">传真</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="fax" name="fax" value="${e.fax}" data-rule="fax;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">手机</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="phone" name="phone"
                                       value="${e.phone}" data-rule="mobile"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">邮箱</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="email" name="email" value="${e.email}"
                                       data-rule="邮箱:required;email;length[0~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">备案号</td>
                            <td style="text-align: left;">
                                <input type="text" size="80" id="icp" name="icp" value="${e.icp}"
                                       data-rule="备案号:required;icp;length[0~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">站长统计代码</td>
                            <td style="text-align: left;">
                                <textarea id="statisticsCode" class="textArea" cols="100" rows="8"
                                          name="statisticsCode"
                                >${e.statisticsCode}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">是否开放网站</td>
                            <td style="text-align: left;">
                                <input type="radio" id="isopen" name="isopen" value="true"
                                       <c:if test="${e.isopen eq 'true'}">checked="checked"</c:if> />站点开放
                                <input type="radio" id="isopen" name="isopen" value="false"
                                       <c:if test="${e.isopen eq 'false'}">checked="checked"</c:if> />站点关闭
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">关闭信息</td>
                            <td style="text-align: left;">
                                <textarea id="closeMsg" name="closeMsg" class="textArea" cols="100"
                                          rows="6">${e.closeMsg}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tabs-2">
                    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
                        <tr>
                            <td style="text-align: right; width: 100px">图片根路径</td>
                            <td style="text-align: left;"><input type="text" size="80"
                                                                 name="imageRootPath" value="${e.imageRootPath}"
                                                                 id="imageRootPath"
                                                                 data-rule="图片根路径:required;imageRootPath;length[0~100];"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">favicon</td>
                            <td style="text-align: left;"><input type="text" size="80"
                                                                 id="favicon" name="favicon" value="${e.favicon}"
                            />
                                <input type="button" name="faviconfile" value="选择图片" class="btn btn-primary"
                                       style="padding: 0px 12px;margin-top: -5px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">logo</td>
                            <td style="text-align: left;"><input type="text" name="logo" size="80"
                                                                 value="${e.logo}" id="logo"
                                                                 data-rule="logo:required;logo;length[0~100];"/>
                                <input type="button" name="logofile" value="选择图片" class="btn btn-primary"
                                       style="padding: 0px 12px;margin-top: -5px;"/></td>
                        </tr>
                    </table>
                </div>
                <div id="tabs-3">
                    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
                        <tr>
                            <td style="text-align: left;" colspan="2">
                                <div class="alert alert-info">
                                    请在下面填写站点客服的QQ组建HTML内容。可以从QQ的网站(http://connect.qq.com/intro/wpa)上取得HTML内容。号码和内容描述可以自己修改。
                                </div>

                            </td>
                        </tr>
                        <tr>

                            <td style="text-align: right; width: 100px">
                                QQ客服编辑
                            </td>
                            <td>
                                <textarea name="qqService"
                                          style="width:100%;height:200px;visibility:hidden;">${e.qqService}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
            <tr>
                <td style="text-align: right; width: 100px"></td>
                <td style="text-align: left;">
                    <button class="btn btn-info" style="padding: 2px 22px;">
                        提交
                    </button>
                </td>
            </tr>
        </table>
    </div>
</form>
<script>
    var qqService;
    KindEditor.ready(function (K) {
        qqService = K.create('textarea[name="qqService"]', {
            filterMode: false,
            allowFileManager: true,
            uploadJson: '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
            fileManagerJson: '<%=path%>/resource/kindeditor/jsp/file_manager_json.jsp'

        });
        var editor = K.editor({
            allowFileManager: true,
            uploadJson: '<%=path%>/resource/kindeditor/jsp/upload_json.jsp',
            fileManagerJson: '<%=path%>/resource/kindeditor/jsp/file_manager_json.jsp'
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
        K('input[name=faviconfile]').click(function () {
            editor.loadPlugin('image', function () {
                editor.plugin.imageDialog({
                    imageUrl: K('#favicon').val(),
                    clickFn: function (url) {
                        K('#favicon').val(url);
                        editor.hideDialog();
                    }
                });
            });
        });
        K('input[name=logofile]').click(function () {
            editor.loadPlugin('image', function () {
                editor.plugin.imageDialog({
                    imageUrl: K('#logo').val(),
                    clickFn: function (url) {
                        K('#logo').val(url);
                        editor.hideDialog();
                    }
                });
            });
        });
        K('input[name=clear]').click(function (e) {
            editor.html('');
        });

    });
</script>

<%@ include file="/manage/system/baseFoot.jsp" %>
