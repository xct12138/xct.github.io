<%@ page import="bean.User" %><%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/11/12
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>navbar</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/topNavbar.css">
</head>
<body>
<%
  User user=(User) request.getSession().getAttribute("user");
%>
<div class="navbar">
  <ul class="topnav" >
    <li><a id="logo" href="${pageContext.request.contextPath}/"><img alt="加载失败" src="${pageContext.request.contextPath}/image/logo1.png"></a> </li>
    <li><a class="tb-left topnav-btn " href="${pageContext.request.contextPath}/">主页</a></li>
    <li><a class="tb-left topnav-btn  mainLoginBn" <%if (user!=null) out.print("style=\"display:none\"");%>href="${pageContext.request.contextPath}/source/page/Login.jsp">登录/注册</a></li>
    <li><a class="tb-left topnav-btn " href="#">选项</a></li>
    <li><a class="tb-left topnav-btn " href="#">选项</a></li>
    <li><a class="tb-left topnav-btn" href="#">选项</a></li>
    <li><a class="topnav-btn tb-right" href="" onclick="" style="margin-right: 3%">关于</a></li>
    <li><a class="topnav-btn tb-right" href="${pageContext.request.contextPath}/userBehavior/quit" onclick="exit()" <%if (user==null) out.print("style=\"display:none\"");%>>退出</a> </li>
    <li><a id="user-icon" href="${pageContext.request.contextPath}/source/page/main.jsp"<%if (user==null) out.print("style=\"display:none;\"");%>>
      <%out.print("<img");
        String alt="xct";
        String imgSrc="";
        if (user!=null){
          alt=user.getUid();
          imgSrc=user.getIcon();
        }
        out.print("alt=\""+alt+"\"");
        out.print("src=\""+imgSrc+"\"");
        out.print("width=\"40\" height=\"40\" style=\"margin: auto\">");%>
    </a> </li>
    <li><div class="search">
      <form method="get" action="${pageContext.request.contextPath}/source/page/search.jsp" onsubmit="return noRepeatSubmit()">
        <label>
          <input name="search_context" type="text" placeholder="搜索">
        </label>
      </form>
    </div></li>
  </ul>
</div>
</body>
<script src="${pageContext.request.contextPath}/source/javascript/form.js"></script>
</html>
