<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/4/29
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="icon" href="image/logo1.png">
    <title>xct</title>
    <link rel="stylesheet" type="text/css" href="source/css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="source/css/signinform.css">
    <style>
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
    </style>
  </head>
  <body>

  <%
    //获得数据库连接对象
    Connection connection=null;
    try {
      InitialContext initialContext=new InitialContext();
      DataSource dataSource = (DataSource) initialContext.lookup("java:comp/env/test1");
      connection=dataSource.getConnection();
    } catch (Exception e) {
      e.printStackTrace();
    }
  %>

  <div class="navbar">
    <ul class="topnav" >
      <li><a id="logo" href="index.jsp"><img alt="加载失败" src="image/logo1.png"></a> </li>
      <li><a class="topnav-btn" href="index.jsp">主页</a></li>
      <li><a class="topnav-btn mainLoginBn" <%
        Boolean result = (Boolean) request.getAttribute("loginResult");
        if (result!=null && result){
          out.print("style=\"display:none\"");
        }
      %>href="source/page/Login.jsp">登录/注册</a></li>
<%--      <li><a class="topnav-btn" onclick="document.getElementById('signinfrom').style.display='block'" href="#">登录</a></li>--%>
<%--      <li><a class="topnav-btn" onclick="document.getElementById('signupfrom').style.display='block'" href="#">注册</a></li>--%>
      <li><a class="topnav-btn" href="" onclick="" style="float: right;margin-right: 3%">关于</a></li>
      <li><a id="user-icon" href="source/page/main.jsp">
        <img <%
          String uname=(String) request.getAttribute("uid");
          if (uname==null){
            uname="xct";
          }
          out.print("alt=\""+uname+"\"");


        %>>
      </a> </li>
      <li><div class="search">
        <form method="get" action="#">
          <label>
            <input name="search_context" type="text" placeholder="搜索">
          </label>
          <!--                <input type="submit">-->
        </form>
      </div></li>
    </ul>
    <div id="signinfrom" class="modal">

      <form class="modal-content animate" action="${pageContext.request.contextPath}/signin" method="post">
        <div class="imgcontainer">
          <span onclick="document.getElementById('signinfrom').style.display='none'" class="close" title="Close Modal">&times;</span>
          <img src="https://static.runoob.com/images/mix/img_avatar.png" alt="Avatar" class="avatar">
        </div>

        <div class="container">
          <label><b>Username</b></label>
          <input type="text" placeholder="Enter Username" name="uname" required>

          <label><b>Password</b></label>
          <input type="password" placeholder="Enter Password" name="pwd" required>

          <button type="submit">登陆</button>
          <input type="checkbox" checked="checked"> 记住我
        </div>

        <div class="container" style="background-color:#f1f1f1">
          <button type="button" onclick="document.getElementById('signinfrom').style.display='none'" class="cancelbtn">Cancel</button>
          <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
      </form>
    </div>
    <div id="signupfrom" class="modal">

      <form class="modal-content animate" action="${pageContext.request.contextPath}/signup" method="post">
        <div class="imgcontainer">
          <span onclick="document.getElementById('signupfrom').style.display='none'" class="close" title="Close Modal">&times;</span>
        </div>

        <div class="container">
          <label><b>Username</b>
            <input type="text" placeholder="Enter Username" name="uname" required>
          </label>
          <label><b>Password</b>
            <input type="password" placeholder="Enter Password" name="psw" required>
          </label>
          <label><b>Email</b>
            <input type="email" placeholder="Enter Email" name="email" required>
          </label>
          <button type="submit">注册</button>
        </div>
      </form>
    </div>
  </div>
  <div class="context" >

  </div>
  </body>
</html>