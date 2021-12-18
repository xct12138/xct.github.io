<%@ page import="bean.User" %>
<%@ page import="service.ArticleService" %>
<%@ page import="bean.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.io.ReadText" %><%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/11/23
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        User user=(User) request.getSession().getAttribute("user");
        ArticleService articleService=new ArticleService();
        List<Article> articles = articleService.queryArticle_aid(request.getParameter("aid"));
        if (articles.size()==0) response.sendRedirect(request.getRequestURI());
    %>
    <link rel="icon" href="${pageContext.request.contextPath}/image/logo1.png">
    <title><%=articles.get(0).getTitle()%></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp" flush="true"/>
<div>
<%--<div class="tool-bar">--%>
<%--    <form action="${pageContext.request.contextPath}/userBehavior/collect" enctype="multipart/form-data" target="frameName">--%>
<%--        <input type="hidden" name="aid" value="<%=articles.get(0).getAid()%>">--%>
<%--        <button type="submit" class="form-submit">收藏</button>--%>
<%--    </form>--%>
<%--    <iframe src="" frameborder="0" name="frameName" width="0" height="0"></iframe>--%>
<%--    <div class="article-info">--%>
<%--        <div id="aid">--%>
<%--            <span class="article-date" >aid:</span>--%>
<%--            <span class="article-date" id="article-aid"><%=articles.get(0).getAid()%></span>--%>
<%--        </div>--%>
<%--        <div id="likeText">--%>
<%--            <span class="article-date" >点赞:</span>--%>
<%--            <span class="article-date" id="article-like"><%=articles.get(0).getLikeText()%></span>--%>
<%--        </div>--%>
<%--        <div id="collect">--%>
<%--            <span class="article-date" >收藏:</span>--%>
<%--            <span class="article-date" id="article-collect"><%=articles.get(0).getCollect()%></span>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="context-box" >--%>
<%--    <h2><%=articles.get(0).getTitle()%></h2>--%>
<%--    <div class="line" ></div>--%>
<%--    <div id="text">--%>
<%--        <%--%>
<%--            ReadText readText=new ReadText(articles.get(0).getTextPath());--%>
<%--            //out.print(readText.readAll());--%>
<%--            String s;--%>
<%--            do {--%>
<%--                s=readText.readLine();--%>
<%--                out.print("<p>"+s+"</p>");--%>
<%--            }while (s!=null);--%>
<%--        %>--%>
<%--    </div>--%>

<%--</div>--%>
</div>
<div class="container justify-content-center">
    <nav class="navbar fixed-bottom navbar-light bg-light">
      <a class="navbar-brand" href="#">固定在底部</a>
    </nav>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
