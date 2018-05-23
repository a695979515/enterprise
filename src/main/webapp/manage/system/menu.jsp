<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Collection" %>
	<%@page import="com.enterprise.entity.MenuItem" %>
	<%@page import="com.enterprise.entity.Menu" %>
<script>
    $(function(){
        $('#side-menu').metisMenu();
        var parent = $("li.menu-item.active").parent();
        if(parent.is("ul.submenu")){
            parent.addClass("in").parent().addClass("active open");
        }
    });
</script>
<%
Collection<MenuItem> menus = (Collection<MenuItem>)session.getAttribute("userMenus");
%>

        <ul class="nav nav-list" id="side-menu">

            <%if(menus!=null && menus.size()>0){
                for(MenuItem menu:menus){ %>
            <li class="menu-item <%if(getServletInfo().equals(menu.getName())){%>active<%}%>">
                <a id="item_<%=menu.getPid() %>_<%=menu.getId() %>"  href="<%=path%><%=menu.getUrl() %>" >
                    <i class="<%=menu.getIcon() %>"></i>
                    <span class="menu-text"><%=menu.getName() %></span>

                <%if(menu.getChildren()!=null){%>
                    <b class="arrow icon-angle-down"></b>
                <%} %>
                </a>
                <%if(menu.getChildren()!=null){%>
                <ul class="submenu">
                    <% for(MenuItem menuChild : menu.getChildren()){ %>
                    <li  class="menu-item <%if(getServletInfo().equals(menuChild.getName())){%>active<%}%>" >
                        <a id="item_<%=menuChild.getPid() %>_<%=menuChild.getId() %>"  href="<%=path%><%=menuChild.getUrl() %>" >
                            <i class="icon-double-angle-right"></i>
                            <%=menuChild.getName() %>
                        </a>
                    </li>
                    <%} %>
                </ul>
                <%} %>
            </li>
            <%} }%>
        </ul>

