<%@ page import="bean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/4/29
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <%
      User user=(User) request.getSession().getAttribute("user");
    %>
    <link rel="icon" href="image/logo1.png">
    <title><%
      if (user!=null)out.print(user.getUid());
      else out.print("XCT");
    %></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/pageBackground.css">
    <style>
      .context-box-main{
        padding: 62px 15% 0;
        width: 100%;
      }
    </style>
  </head>
  <body class="background-d">

  <jsp:include page="/source/page/navbar.jsp" flush="true"/>
  <div class="context-box-main" >
    <jsp:include page="/source/page/contextList.jsp" flush="true"/>
  </div>
  </body>
</html>