<%@ page import="bean.User" %>
<%@ page import="dao.sql.UserQuery" %>
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
    <link rel="stylesheet" type="text/css" href="source/css/pageBackground.css">
    <link rel="stylesheet" type="text/css" href="source/css/signinform.css">
    <link rel="stylesheet" type="text/css" href="source/css/contextTable.css">
  </head>
  <body class="background-d">
  <%
    User user=(User) request.getAttribute("user");
  %>
  <jsp:include page="/source/page/navbar.jsp" flush="true"/>
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
  <script type="text/javascript" src="source/javascript/form.js"></script>
  </body>
</html>