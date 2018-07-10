<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/17
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="/front/common/common.jsp" %>
<style>
    table td{
        padding:5px;
    }
    .leaveSuccess{
        display: none;
        background: #ffffff;
        border: 1px solid #ececec;
        width: 200px;
        height: 80px;
        line-height: 80px;
        font-size: 18px;
        text-align: center;
        position: fixed;
        top: 40%;
        left: 50%;
        box-shadow:0px 0px 10px #ececec;
        -moz-box-shadow: 0 0 10px #ececec;
        -webkit-box-shadow: 0 0 10px #ececec;
    }
</style>
<link rel="stylesheet" href="<%=path%>/resource/validator/jquery.validator.css">
<script type="text/javascript" src="<%=path%>/resource/validator/jquery.validator.min.js"></script>
<script type="text/javascript" src="<%=path%>/resource/validator/local/zh-CN.js"></script>
<body>
<%@include file="/front/common/navigation.jsp" %>
<div class="banner" style="background-image: url(<%=path%>/resource/images/banner.jpg)">

</div>
<div class="warp_main">
    <div class="warp_left">
        <div class="warp_left_box">
            <h3>在线留言</h3>

        </div>
    </div>
    <div class="warp_right">
        <div class="breadcrumb">
            <a href="<%=path%>/index">首页</a>
            >
            <a href="<%=path%>/message">在线留言</a>
        </div>
        <div style="overflow: hidden;">
            <div class="article_content">

                <form id="messageForm"  method="post" onsubmit="return leaveMessage();">
                    <table width="100%" border="0" cellspacing="0" cellpadding="7">
                        <tr>
                            <td width="100" align="right">
                                标题:
                            </td>
                            <td><input type="text" class="message_input" name="title" id="title" data-rule="标题:required;length[1~20];"></td>
                        </tr>
                        <tr>
                            <td align="right">
                                姓名:
                            </td>
                            <td><input type="text" class="message_input" name="name" id="name" data-rule="姓名:required;">

                            </td>
                        </tr>
                        <tr>
                            <td align="right">性别：</td>
                            <td><input type="radio" name="gender" value="m" checked="checked">男士 &nbsp;&nbsp;&nbsp;
                                <input
                                        type="radio" name="gender" value="f">女士
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                联系电话:
                            </td>
                            <td><input type="text" class="message_input" name="tel" id="tel" data-rule="联系电话:required;mobile;"></td>
                        </tr>
                        <tr>
                            <td align="right">Email:</td>
                            <td><input type="text" class="message_input" name="email" id="eamil" data-rule="邮件:required;email;"></td>
                        </tr>
                        <tr>
                            <td align="right">内容:</td>
                            <td><textarea rows="5" cols="50" class="message_textarea" name="content" id="content" data-rule="内容:required;length[1~300];"></textarea></td>
                        </tr>
                        <tr>
                            <td align="right">验证码:</td>
                            <td><input type="text" class="message_input" name="vcode" id="vcode" data-rule="验证码:required;length[1~300];remote[checkVcode]" style="width:100px;"><img src="<%=path%>/getVerificationCode.do" style="margin-left:50px;height: 28px;width:85px;" id="codes"
                                                        onclick="javaScript:reloadImg();"/></td>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" class="message_sum"  value="提交"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="leaveSuccess">
    <img src="<%=path%>/resource/images/ok.png" style="width: 30px;vertical-align:middle;margin-top: -3px;">留言成功!
</div>
<script>
    function leaveMessage(){
        var _url=" <%=path%>/message/leaveMessage";
        if($("#title").val()!='' && $("#name").val()!='' && $("#tel").val()!='' && $("#email").val()!='' && $("#content").val()!='') {
            $.ajax({
                type: 'POST',
                url: _url,
                data: $('#messageForm').serialize(),
                dataType: "html",
                success: function (data) {
                    $('#messageForm')[0].reset();
                    if(data=="ok"){
                        $(".leaveSuccess").animate({top:'40%'}).fadeIn("fast");
                        setTimeout(function(){
                            $(".leaveSuccess").animate({top:'40%'}).fadeOut("fast");
                        }, 3000);
                    }
                },
                error: function (er) {
                }
            });
        }
        return false;
    }
    /**
     * 更换验证码
     */
    function reloadImg() {
        document.getElementById("codes").src = "<%=path%>/getVerificationCode?" + "radom="
                + Math.random();
        $("#vcode").focus();
    }
</script>

<%@include file="/front/common/foot.jsp" %>
