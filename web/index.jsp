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
    <link rel="icon" href="image/logo1.png">
    <title>xct</title>
    <link rel="stylesheet" type="text/css" href="source/css/topnav.css">
    <link rel="stylesheet" type="text/css" href="source/css/signinform.css">
    <link rel="stylesheet" type="text/css" href="source/css/contextTable.css">
    <%
      Boolean result = (Boolean) request.getAttribute("loginResult");
      User user=(User) request.getAttribute("user");
    %>
    <style>

    </style>
  </head>
  <body>

  <div class="navbar">
    <ul class="topnav" >
      <li><a id="logo" href="index.jsp"><img alt="加载失败" src="image/logo1.png"></a> </li>
      <li><a class="topnav-btn" href="index.jsp">主页</a></li>
      <li><a class="topnav-btn mainLoginBn" <%if (result!=null && result) out.print("style=\"display:none\"");%>href="source/page/Login.jsp">登录/注册</a></li>
      <li><a class="topnav-btn" href="#">选项</a></li>
      <li><a class="topnav-btn" href="#">选项</a></li>
      <li><a class="topnav-btn" href="#">选项</a></li>

      <%--      <li><a class="topnav-btn" onclick="document.getElementById('signinfrom').style.display='block'" href="#">登录</a></li>--%>
<%--      <li><a class="topnav-btn" onclick="document.getElementById('signupfrom').style.display='block'" href="#">注册</a></li>--%>
      <li><a class="topnav-btn" href="" onclick="" style="float: right;margin-right: 3%">关于</a></li>
      <li><a id="user-icon" href="source/page/main.jsp"
              <%
                if (result!=null && result)out.print("style=\"display:block;\"");
                else out.print("style=\"display:none;\"");
              %>>
        <img <%
          String alt="xct";
          String imgSrc="";
          if (user!=null){
            alt=user.getUid();
            imgSrc=user.getIcon();
          }
          out.print("alt=\""+alt+"\" ");
          out.print("src=\""+imgSrc+"\"");
        %>width="50" height="50" style="margin: auto">
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
  </div>
  <div class="context-box" >
    <%
      StringBuilder a_href= new StringBuilder("#");
      StringBuilder title= new StringBuilder("文章标题");
      StringBuilder text= new StringBuilder("文章正文：而 border-box 则指 IE盒子模型，也称为“怪异盒子模型”。此模型下，边框和填充并不会影响元素的宽高，相当于是将元素的空间霸占成自己的空间，元素总体大小不变，内容空间变小，边框、填充则霸占着原本属于内容空间的地方。这在平时设计布局时，就非常的舒服，因为在指定元素尺寸并设置该属性值后，元素尺寸就不会因被破坏而又得重新计算了");
      for (int i = 0; i < 30; i++) {
        //根据具体数据更改以上3个变量
        out.print("<div class=\"text-box\" >");
        out.print("<a class=\"context-text-title\" href=\""+a_href+"\"><h3>"+title+"</h3></a> <br>");
        out.print("<p class=\"context-text \">"+text+"</p>\n" +
                "</div>");
      }
    %>
  </div>
  </body>
</html>