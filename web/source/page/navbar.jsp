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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    .navbar{
      width: 100%;
      height: 60px;
      margin:0;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4);
      position: fixed;
      background: rgba(100, 87, 114, 0.8);

    }

    .navbar ul{
      list-style-type: none;
      margin: 0;
      padding: 0;
      margin-block-start: 0;
      margin-block-end: 0;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 0;
    }

    .topnav-btn{
      width: 80px;
      height: 100%;
      display: block;
      padding: 20px 12px;
      margin: 0 0 0 30px;
      text-align: center;
      font-size: 16px;
      color: seashell;
    }
    .topnav-btn:hover,.topnav-btn:active{
      background-color: rgba(64, 90, 108, 0.46);
      color: aquamarine;
    }
  </style>
</head>
<body >
<%
  User user=(User) request.getSession().getAttribute("user");
%>
<div class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img alt="" src="${pageContext.request.contextPath}/image/logo1.png" width="65" height="40"></a>
  <div class="collapse navbar-collapse" id="navbarNav">
  <ul class=" navbar-nav" >
    <li class="nav-item active">
      <a class="topnav-btn  " href="${pageContext.request.contextPath}/" style="text-decoration: none">主页</a></li>
    <li class="nav-item active">
      <a class=" topnav-btn" href="#" style="text-decoration: none">选项</a></li>
    <li class="nav-item active">
      <a class=" topnav-btn" href="#" style="text-decoration: none">选项</a></li>
    <li class="nav-item active">
      <a class=" topnav-btn" href="#" style="text-decoration: none">选项</a></li>
    <li class="nav-item active">
      <div class="search">
      <form class="form-inline my-2 my-lg-0" method="get" action="${pageContext.request.contextPath}/source/page/search.jsp" onsubmit="return noRepeatSubmit()">
        <label>
          <input name="search_context" type="text" placeholder="搜索">
        </label>
      </form>
    </div></li>
    <li class="nav-item active" style="margin-left: 400px"></li>
    <li class="nav-item active">
      <a class=" topnav-btn" <%if (user!=null) out.print("style=\"display:none\"");else out.print("style=\"text-decoration: none\"");%>href="${pageContext.request.contextPath}/source/page/Login.jsp">登录</a></li>
    <li class="nav-item active" >
      <a id="user-icon" href="${pageContext.request.contextPath}/source/page/main.jsp"<%if (user==null) out.print("style=\"display:none;\"");%>>
        <%out.print("<img");
          String alt="xct";
          String imgSrc="";
          if (user!=null){
            alt=user.getUid();
            imgSrc=user.getIcon();
          }
          out.print(" class=\"rounded-circle\" alt=\""+alt+"\"");
          out.print(" src=\""+imgSrc+"\"");
          out.print(" width=\"40\" height=\"40\" style=\"margin: auto\">");%>
      </a>
    </li>
    <li class="nav-item active"  >
      <a class="topnav-btn  tb-right" href="${pageContext.request.contextPath}/userBehavior/quit" onclick="exit()" <%if (user==null) out.print("style=\"display:none;text-decoration: none\"");%>>退出</a>
    </li>
    <li class="nav-item active"  >
      <a class="topnav-btn tb-right" href="" onclick="" style="margin-right: 3%;text-decoration: none">关于</a>
    </li>
  </ul>
  </div>
</div>
<script src="${pageContext.request.contextPath}/source/javascript/form.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
