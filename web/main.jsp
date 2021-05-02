<%--
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
    <%
        if((Boolean)request.getAttribute("result")){
            out.print("登陆成功");
        }
    %>
</body>
</html>
