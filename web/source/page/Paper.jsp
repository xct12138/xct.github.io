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
    <link rel="stylesheet" type="text/css" href="../css/pageBackground.css">
    <link rel="stylesheet" type="text/css" href="../css/articlePager.css">
</head>
<body class="background-d">
<jsp:include page="navbar.jsp" flush="true"/>
<div class="tool-bar">
    <form action="${pageContext.request.contextPath}/userBehavior/collect" enctype="multipart/form-data" target="frameName">
        <input type="hidden" name="aid" value="<%=articles.get(0).getAid()%>">
        <button type="submit" class="form-submit">收藏</button>
    </form>
    <iframe src="" frameborder="0" name="frameName" width="0" height="0"></iframe>
    <div class="article-info">
        <div id="aid">
            <span class="article-date" >aid:</span>
            <span class="article-date" id="article-aid"><%=articles.get(0).getAid()%></span>
        </div>
        <div id="likeText">
            <span class="article-date" >点赞:</span>
            <span class="article-date" id="article-like"><%=articles.get(0).getLikeText()%></span>
        </div>
        <div id="collect">
            <span class="article-date" >收藏:</span>
            <span class="article-date" id="article-collect"><%=articles.get(0).getCollect()%></span>
        </div>
    </div>
</div>
<div class="context-box" >
    <h2><%=articles.get(0).getTitle()%></h2>
    <%
        ReadText readText=new ReadText(articles.get(0).getTextPath());
        String s;
        do {
            s=readText.readLine();
            out.print("<p>"+s+"</p>");
        }while (s!=null);
    %>
</div>
</body>
</html>
