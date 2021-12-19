<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/11/22
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/contextTable.css">
</head>
<%
    User user=(User) request.getSession().getAttribute("user");
%>
<body>
<div class="context-box">
    <%
        service.ArticleService articleService=new service.ArticleService();
        List<bean.Article> articles=null;
        String select=request.getParameter("select");
        if (select==null){
            articles=articleService.queryArticle_title("");
        }else if ("my".equals(select)){
            articles= articleService.queryArticle_author(user.getUid());
        }else if ("collect".equals(select)){
            articles=articleService.queryArticle_collect(user.getUid());
        }else if ("title".equals(select)){
            articles=articleService.queryArticle_title(request.getParameter("title"));
        }else {
            articles=new ArrayList<>();
        }
        String title=null;
        String text= null;
        int textLen=300;
        dao.io.ReadText readText=new dao.io.ReadText();
        for (bean.Article article : articles) {
            title=article.getTitle();
            readText.setTextPath(article.getTextPath());
            text=readText.readSegment(0,textLen);
            //根据具体数据更改以上3个变量
   %>
            <div class="text-box">
                <a class="context-text-title" type="submit" target="_blank"
                   href="${pageContext.request.contextPath}/source/page/Paper.jsp?aid=<%=article.getAid()%>">
                   <h3><%=title%></h3>
                </a> <br>
                <p class="context-text "><%=text%></p>
            </div>
     <%}
    %>
</div>
</body>
</html>
