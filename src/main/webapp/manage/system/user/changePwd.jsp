<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="网站管理员" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<div class="alert alert-block alert-info" >
    <button type="button" class="close" data-dismiss="alert">
        <i class="icon-remove"></i>
    </button>

    密码修改成功，请重新登录系统！

</div>
<script type="text/javascript">
    $(function() {
        setTimeout(function(){window.location="<%=path%>/manage/user/logout";},2000);
    });
</script>
<%@ include file="/manage/system/baseFoot.jsp" %>