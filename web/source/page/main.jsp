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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/pageBackground.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/umain.css">
</head>
<body class="background-main">
<div class="page-top-bar">
    <jsp:include page="navbar.jsp" flush="true"/>
</div>
<%
    User user=(User) request.getSession().getAttribute("user");
%>

<div class="user-info-box">
    <div class="user-icon">
        <img src="<%=user.getIcon()%>" alt="<%=user.getId()%>">
    </div>
    <div class="user-ul">
        <ul>
            <li><a class="" href="contextList.jsp?select=my" target="iframe-article">我的</a></li>
            <li><a class="" href="contextList.jsp?select=collect" target="iframe-article">收藏夹</a></li>
        </ul>
    </div>
</div>
<div class="context-text-box">
    <div class="cutoff-rule"></div>
    <div class="user-article-box">
        <iframe name="iframe-article" src="contextList.jsp?select=my" frameborder="0" width="99%" height="100%" ></iframe>
    </div>
</div>

</body>
</html>
