<%--
  Created by IntelliJ IDEA.
  User: Cesiumai
  Date: 2016/6/17
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<div class="foot">
    <div class="foot_top">
        <div style="width: 1000px;margin: 12px auto 0;overflow: hidden;">
            <ul>
                <li>友情链接：</li>
                <c:forEach var="item" items="<%=SystemManage.getInstance().getFriendLinks()%>">
                    <li><a href="${item.url}" target="${item.target}">${item.name}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="foot_bottom">
        <p> Copyright
            2016 <%=SystemManage.getInstance().getSystemSetting().getTitle()%> <%=SystemManage.getInstance().getSystemSetting().getIcp()%>
        </p>
    </div>
</div>

</body>
</html>
