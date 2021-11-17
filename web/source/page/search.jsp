<%@ page import="bean.User" %><%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/11/11
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/image/logo1.png">
    <title>search</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/pageBackground.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/contextTable.css">

</head>
<body class="background-c">
<%
    User user=(User) request.getAttribute("user");
%>
<jsp:include page="navbar.jsp" flush="true"/>

<div class="context-box">
    <%
        for (int i = 0; i < 6; i++) {
            for (int j = 0; j < 5; j++) {


    %>
    <div class="card">
        <img src="https://static.runoob.com/images/mix/img_avatar.png" alt="Avatar" style="width:100%">
        <div class="container">
            <a class="context-text-title"><h4>文章名</h4></a>
            <p>部分内容</p>
        </div>
    </div>
    <%
            }
        }
    %>
</div>

</body>
</html>
