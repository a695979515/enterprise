<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="首页" %>

<style>
    ul, ol {
        list-style: none;
    }
    ul, ol {
        margin: 0;
        padding: 0;
    }
</style>
<div id="index" style="padding-top:18px;height:auto!important;height:550px;min-height:550px;">

    <div class="indexBox">
        <div class="boxTitle">服务器信息</div>
        <ul>
            <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
                <tr>
                    <th width="120" valign="top">JAVA 版本：</th>
                    <td valign="top"><%=SystemManage.getInstance().getSystemSetting().getJavaVersion() %>
                    </td>
                    <th width="120" valign="top">JAVA 路径：</th>
                    <td valign="top"><%=SystemManage.getInstance().getSystemSetting().getJavaHome() %>
                    </td>
                    <th width="120" valign="top">MySQL版本：</th>
                    <td valign="top"><%=SystemManage.getInstance().getSystemSetting().getMysqlVersion() %>
                    </td>
                </tr>
                <tr>
                    <th valign="top">服务器操作系统：</th>
                    <td valign="top"><%=SystemManage.getInstance().getSystemSetting().getOsName() %>
                    </td>
                    <th valign="top">操作系统版本：</th>
                    <td valign="top"><%=SystemManage.getInstance().getSystemSetting().getOsVersion() %>
                    </td>
                    <td valign="top"></td>
                    <td valign="top"></td>
                </tr>
                <tr>
                    <th valign="top">Servlet信息：</th>
                    <td valign="top"><%=SystemManage.getInstance().getSystemSetting().getServerInfo() %>
                    </td>
                    <th valign="top">Servlet版本：</th>
                    <td valign="top"><%=SystemManage.getInstance().getSystemSetting().getServerVersion() %>
                    </td>
                    <td valign="top"></td>
                    <td valign="top"></td>
                </tr>
            </table>
        </ul>
    </div>

    <div class="indexBox">
        <div class="boxTitle">SEO设置</div>
        <ul>
            <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
                <tr>
                    <th width="120"> 站点标题：</th>
                    <td><%=SystemManage.getInstance().getSystemSetting().getTitle()%>
                    </td>
                </tr>
                <tr>
                    <th> 站点描述：</th>
                    <td><%=SystemManage.getInstance().getSystemSetting().getDescription()%>
                    </td>
                </tr>
                <tr>
                    <th> 站点关键字：</th>
                    <td><%=SystemManage.getInstance().getSystemSetting().getKeywords()%>
                    </td>
                </tr>
                <tr>
                    <th> 门户站点：</th>
                    <td><a target="_blank"
                            href="<%=SystemManage.getInstance().getSystemSetting().getWww() %>"><%=SystemManage.getInstance().getSystemSetting().getWww() %>
                    </a>
                    </td>
                </tr>
            </table>
        </ul>
    </div>

    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="indexBoxTwo">
        <tr>
            <td width="55%" valign="top" class="pr">
                <div class="indexBox">
                    <div class="boxTitle">网站基本信息</div>
                    <ul>
                        <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
                            <tr>
                                <th width="120">系统名称：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getName() %>
                                </td>
                                <th width="100">系统版本：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getVersion() %>
                                </td>
                            </tr>

                            <tr>
                                <th>门户站点：</th>
                                <td><a target="_blank"
                                               href="<%=SystemManage.getInstance().getSystemSetting().getWww() %>"><%=SystemManage.getInstance().getSystemSetting().getWww() %>
                                </a></td>
                                <th>网站标题：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getTitle() %>
                                </td>
                            </tr>
                            <tr>
                                <th width="120">图片根路径：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getImageRootPath() %>
                                </td>
                                <th width="100">系统语言：</th>
                                <td>zh_cn</td>
                            </tr>

                            <tr>
                                <th>是否开放网站：</th>
                                <td>
                                    <%if ((SystemManage.getInstance().getSystemSetting().getIsopen()).equals("true")) { %>
                                    开放
                                    <%} else {%>
                                    关闭
                                    <%} %>
                                </td>
                                <th>编码：</th>
                                <td>UTF-8</td>
                            </tr>
                            <tr>
                                <th>联系地址：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getAddress() %>
                                </td>
                                <th>传真：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getFax() %>
                                </td>
                            </tr>
                            <tr>
                                <th>联系手机：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getPhone() %>
                                </td>
                                <th>联系电话：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getTel() %>
                                </td>
                            </tr>
                            <tr>
                                <th>邮箱：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getEmail() %>
                                </td>
                                <th>备案号：</th>
                                <td><%=SystemManage.getInstance().getSystemSetting().getIcp() %>
                                </td>
                            </tr>
                            <tr>
                                <th>网站关闭信息：</th>
                                <td colspan="3">
                                    <%=SystemManage.getInstance().getSystemSetting().getCloseMsg() %>
                                    </td>
                            </tr>
                        </table>
                    </ul>
                </div>
            </td>
            <td valign="top" class="pl">
                <div class="indexBox">
                    <div class="boxTitle">最新留言</div>
                    <ul>
                        <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
                            <tr>
                                <th width="45%" style="text-align: center;">留言标题</th>
                                <th width="15%" style="text-align: center;">留言人</th>
                                <th width="30%" style="text-align: center;">留言时间</th>
                            </tr>
                            <c:forEach var="item" items="<%=SystemManage.getInstance().getMessages() %>">
                                <tr>
                                    <td align="center">${item.title}</td>
                                    <td align="center">${item.name}</td>
                                    <td align="center">${item.leavetime}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </ul>
                </div>
            </td>
        </tr>
    </table>


</div>


<%@ include file="/manage/system/baseFoot.jsp" %>