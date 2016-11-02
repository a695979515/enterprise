<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/16
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<style>
    img{ border:0;  }

    .slideBox {
        width: 100%;
        height: 481px;
        position: relative;
        border: 1px solid #ddd;
    }

    .slideBox .hd {
        width: 100%;
        position: absolute;
        z-index: 1;
        bottom: 0;
        left: 0;
        height: 30px;
        line-height: 30px;
    }

    .slideBox .hd ul {
        text-align: center;
    }

    .slideBox .hd ul li {
        display: inline-block;
        margin: 1px;
        width: 42px;
        height: 11px;
        line-height: 11px;
        text-align: center;
        background: #fff;
        cursor: pointer;
        background: #000;
        filter: alpha(opacity=50);
        opacity: 0.5;

    }

    .slideBox .hd ul li.on {
        background: #f00;
        color: #fff;
    }

    .slideBox .bd {
        margin:0 auto;
        position:relative;
        z-index:0;
        overflow:hidden;
    }
    .slideBox .bd ul {
        width:100% !important;
    }

    .slideBox .bd li {
        width:100% !important;
        height:481px;
        overflow:hidden;
        text-align:center;
    }
    .slideBox .bd li a {
        display:block;
        height:481px;
    }

    /* 下面是前/后按钮样式*/
    .slideBox .prev,
    .slideBox .next {
        position: absolute;
        left: 3%;
        top: 50%;
        margin-top: -25px;
        display: block;
        width: 32px;
        height: 40px;
        background: url(./resource/images/slider-arrow.png) -110px 5px no-repeat;
        filter: alpha(opacity=50);
        opacity: 0.5;
    }

    .slideBox .next {
        left: auto;
        right: 3%;
        background-position: 8px 5px;
    }

    .slideBox .prev:hover,
    .slideBox .next:hover {
        filter: alpha(opacity=100);
        opacity: 1;
    }

    .slideBox .prevStop {
        display: none;
    }

    .slideBox .nextStop {
        display: none;
    }

</style>
<div id="slideBox" class="slideBox">
    <div class="hd">
        <ul>
            <c:forEach var="item" items="<%=SystemManage.getInstance().getIndexImgs()%>">
                <li></li>
            </c:forEach>
        </ul>
    </div>
    <div class="bd">
        <ul>
            <c:forEach var="item" items="<%=SystemManage.getInstance().getIndexImgs()%>">
                <li  _src="url(<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.pictureUrl})"><a href="${item.link}"  target="_blank"></a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- 下面是前/后按钮代码 -->
    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>

</div>

<script>

    jQuery(".slideBox").slide({
        mainCell: ".bd ul",
        effect: "fold",
        autoPlay: true,
        trigger: "click",
        startFun: function(i) {
            var curLi = jQuery(".slideBox .bd li").eq(i);
            if ( !! curLi.attr("_src")) {
                curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
            }
        }
    });

</script>


