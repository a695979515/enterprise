<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="网站管理员" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
    input[type=radio] {
        margin: 0;
        width: 0px !important;
    }

    .jc-demo-box {
        text-align: left;
        background: white;
        border: 1px #bbb solid;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        -webkit-box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.25);
        -moz-box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.25);
        box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.25);
        padding: 1em 2em 2em;
    }

    .page-header {
        margin-top: 4px;
        padding-bottom: 0;
        margin-left: -12px;
        margin-right: -12px;
        margin: 20px 0 30px;
    }

    #preview-pane .preview-container {
        width: 170px;
        height: 170px;
        overflow: hidden;
    }

    .jcrop-holder #preview-pane {
        display: block;
        position: absolute;
        z-index: 2000;
        top: 10px;
        right: -280px;
        padding: 6px;
        border: 1px rgba(0, 0, 0, .4) solid;
        background-color: white;

        -webkit-border-radius: 6px;
        -moz-border-radius: 6px;
        border-radius: 6px;

        -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
        -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
        box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
    }

    #preview-pane .preview-container {
        width: 170px;
        height: 170px;
        overflow: hidden;
    }

    .a-upload {
        padding: 4px 10px;
        height: 30px;
        line-height: 20px;
        position: relative;
        cursor: pointer;
        color: #888;
        background: #fafafa;
        border: 1px solid #ddd;
        border-radius: 4px;
        overflow: hidden;
        display: inline-block;
        *display: inline;
        *zoom: 1
    }

    .a-upload input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
        filter: alpha(opacity=0);
        cursor: pointer
    }

    .a-upload:hover {
        color: #444;
        background: #eee;
        border-color: #ccc;
        text-decoration: none
    }

</style>

<form action="<%=path%>/manage/user/insertOrUpdate" id="form" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="<%=path %>/manage/user/selectList" class="btn btn-primary"
               style="padding: 2px 15px;float:right;"><i class="icon-double-angle-left"></i>返回列表</a>
        </h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="10" class="tableBasic">

            <tr style="display:none;">
                <th>id</th>
                <td><input type="hidden" name="id" value="${e.id}"></td>
            </tr>
            <c:choose>
                <c:when test="${e.id != 0}">
                    <tr>
                        <th style="text-align: right;width: 150px">头像：</th>
                        <td style="text-align: left;">
                            <c:choose>
                                <c:when test="${!empty e.portrait}">
                                    <img class="nav-user-photo"
                                         src="<%=path%>/${e.portrait}"/>
                                </c:when>
                                <c:otherwise>
                                    <img class="nav-user-photo"
                                         src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %>/resource/images/portrait.jpg"/>
                                </c:otherwise>
                            </c:choose>
                            <button type="button" class="btn btn-primary " style="padding:2px 15px;" data-toggle="modal"
                                    onclick="clickModal()">
                                更换头像
                            </button>
                        </td>
                    </tr>
                </c:when>
            </c:choose>
            <tr>
                <th style="text-align: right;width: 150px">登录帐号：</th>
                <td style="text-align: left;">
                    <c:choose>
                        <c:when test="${empty e.username}">
                            <input type="text" name="username" id="username"  size="40"
                                   data-rule="帐号:required;username;length[4~20];remote[unique,id]" >
                        </c:when>
                        <c:otherwise>
                            <strong>${e.username}</strong>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;">管理员名称：</th>
                <td style="text-align: left;">
                    <input type="text" name="nickname" value="${e.nickname}" id="nickname"  size="40"
                           data-rule="管理员名称:required;nickname;length[2~20];remote[unique, id]"/>
                </td>
            </tr>
            <tr>
                <th style="text-align: right;">电子邮箱：</th>
                <td style="text-align: left;">
                    <input type="text" name="email" data-rule="电子邮箱:required;email"  size="40" id="email"
                           value="${e.email}"/>
                </td>
            </tr>
            <c:choose>
                <c:when test="${!empty e.username}">
                    <tr>
                        <th style="text-align: right;">原密码：</th>
                        <td style="text-align: left;"><input type="password" name="oldPassword"
                                                             size="40"
                                                             data-rule="密码:password;length[6~20];"
                                                             id="oldPassword"/>
                        </td>
                    </tr>
                </c:when>
            </c:choose>
            <tr>
                <c:choose>
                <c:when test="${!empty e.username}">
                    <th style="text-align: right;">新密码：</th>
                    <td style="text-align: left;"><input type="password" name="newpassword"  size="40"
                                                         data-rule="密码:password;length[6~20];"
                                                         id="newpassword"/>

                        (不输入表示不修改密码)
                    </td>
                </c:when>
                <c:otherwise>
                <th style="text-align: right;">密码：</th>
                <td style="text-align: left;"><input type="password" name="password"  size="40"
                                                     data-rule="密码:required;password;length[6~20];"
                                                     id="password"/>
                    </c:otherwise>
                    </c:choose>
            </tr>


            <tr>
                <th style="text-align: right;">确认密码：</th>
                <td style="text-align: left;"><input type="password" name="newpassword2"  size="40"
                                                     data-rule="确认密码:match(password)"
                                                     id="newpassword2"/>
                </td>
            </tr>


            <tr>
                <td colspan="2" style="text-align: center;">
                    <button class="btn btn-info" style="padding:2px 15px;">
                        提交
                    </button>
                </td>
            </tr>
        </table>
    </div>
</form>
<form name="form" action="<%=path%>/manage/user/uploadHeadImage" class="form-horizontal"
      method="post" enctype="multipart/form-data">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width:950px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="destroyApi();"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">更换头像</h4>
                </div>
                <div class="modal-body">

                    <div class="jc-demo-box">

                        <div class="page-header">
                            <a href="javascript:;" class="a-upload">
                                <input class="photo-file" type="file" name="imgFile" id="fcupload"
                                       onchange="readURL(this);"/>选择图片
                            </a>
                            <img src="" id="target" alt=""/>
                            <input type="hidden" id="x" name="x"/>
                            <input type="hidden" id="y" name="y"/>
                            <input type="hidden" id="w" name="w"/>
                            <input type="hidden" id="h" name="h"/>

                        </div>
                        <div id="preview-pane">
                            <div class="preview-container">
                                <img src="" class="jcrop-preview" id="preview" alt=""/>
                            </div>
                        </div>


                    </div>
                    <div class="modal-footer" style="background-color:#ffffff;">
                        <button type="button" class="btn btn-default" style="padding:2px 15px;" data-dismiss="modal"
                                onclick="destroyApi();">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" style="padding:2px 15px;" id="sub">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function clickModal() {
            $("#fcupload").val('');
            var file_val = $("#fcupload").val();
            $("#sub").prop('disabled', true);
            $('#myModal').modal({backdrop: 'static', keyboard: false});
        }
        var api = null;
        function readURL(input) {
            "use strict";
            var jcrop_api,
                    boundx,
                    boundy,

                    $preview = $('#preview-pane'),
                    $pcnt = $('#preview-pane .preview-container'),
                    $pimg = $('#preview-pane .preview-container img'),

                    xsize = $pcnt.width(),
                    ysize = $pcnt.height();

            if (input.files && input.files[0]) {
                $("#sub").removeAttr("disabled");
                var reader = new FileReader();
                reader.readAsDataURL(input.files[0]);
                reader.onload = function (e) {
                    var _src = e.target.result
                    $('#target').removeAttr('src');
                    $('#target').removeAttr("style");
                    $('#target').css('width', "600");
                    $('#target').attr('src', _src);


                    $("#target").load(function(){
                        if (api != undefined) {
                            api.destroy();

                        }
                        api = $.Jcrop('#target', {
                            keySupport: false,
                            onChange: updatePreview,
                            onSelect: updatePreview,
                            bgOpacity: 0.4,
                            aspectRatio: 1

                        });
                        var bounds = api.getBounds();
                        boundx = bounds[0];
                        boundy = bounds[1];
                        jcrop_api = api;


                        $preview.appendTo(jcrop_api.ui.holder);
                        $("#preview").removeAttr('src');
                        $("#preview").removeAttr("style");
                        $("#preview").attr('src', e.target.result);
                    });


                };

            }
            function updatePreview(c) {
                if (parseInt(c.w) > 0) {
                    var rx = xsize / c.w;
                    var ry = ysize / c.h;
                    $pimg.css({
                        width: Math.round(rx * boundx) + 'px',
                        height: Math.round(ry * boundy) + 'px',
                        marginLeft: '-' + Math.round(rx * c.x) + 'px',
                        marginTop: '-' + Math.round(ry * c.y) + 'px'
                    });
                    $("#x").val(c.x);
                    $("#y").val(c.y);
                    $("#w").val(c.w);
                    $("#h").val(c.h);
                }
            }
        }
        ;
        function destroyApi() {
            if (api != undefined) {
                $('#target').removeAttr('src');
                $('#target').removeAttr("style");
                $("#preview").removeAttr('src');
                $("#preview").removeAttr("style");
                api.destroy();
                api = null;
                var file = $("#fcupload");
                file.after(file.clone().val(""));
                file.remove();
                var _html = '<div id="preview-pane"><div class="preview-container"><img src="" class="jcrop-preview" id="preview" alt=""/> </div></div>';
                $(".page-header").after(_html);

            }
        }
    </script>
<%@ include file="/manage/system/baseFoot.jsp" %>