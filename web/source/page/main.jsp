<%@ page import="bean.User" %><%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/5/2
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LogonSuccess</title>
</head>
<body>
<jsp:include page="navbar.jsp" flush="true"/>
    <h1><%
        Boolean result=(Boolean)request.getAttribute("loginResult");
        if (result!=null && result) {
            out.print("登陆成功<br/>");
            out.print("欢迎"+((User)request.getAttribute("user")).getUid());
        }
        else out.print("<a href=\"Login.jsp\">login</a>");
    %></h1>

</body>
</html>
