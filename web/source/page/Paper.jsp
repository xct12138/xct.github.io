<%@ page import="bean.User" %>
<%@ page import="java.util.List" %><%--
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
        service.ArticleService articleService=new service.ArticleService();
        List<bean.Article> articles = articleService.queryArticle_aid(request.getParameter("aid"));
        if (articles.size()==0) response.sendRedirect(request.getRequestURI());
    %>
    <link rel="icon" href="${pageContext.request.contextPath}/image/logo1.png">
    <title><%=articles.get(0).getTitle()%></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
    .img-collect{
        margin: 0;
    }
</style>
</head>
<body style="background-color: #d5d9da">
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
<%--<div class="container justify-content-center">--%>
<%--    <nav class="navbar fixed-bottom navbar-light bg-light">--%>
<%--      <a class="navbar-brand" href="#">固定在底部</a>--%>
<%--    </nav>--%>
<%--</div>--%>
<main class="container" style="padding-top: 70px">

    <div class="row g-5" >
        <div class="col-md-8">
            <h3 class="pb-4 mb-4 fst-italic border-bottom blog-post-title">
                <%=articles.get(0).getTitle()%>
            </h3>

            <article class="blog-post border-0">
                <div>

                    <!--          <h2 class="blog-post-title">Sample blog post</h2>-->
                    <!--          <p class="blog-post-meta">January 1, 2021 by <a href="#">Mark</a></p>-->

                    <!--          <p>This blog post shows a few different types of content that’s supported and styled with Bootstrap. Basic typography, lists, tables, images, code, and more are all supported as expected.</p>-->
                    <!--          <hr>-->
                    <!--          <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>-->
                    <!--          <h2>Blockquotes</h2>-->
                    <!--          <p>This is an example blockquote in action:</p>-->
                    <!--          <blockquote class="blockquote">-->
                    <!--            <p>Quoted text goes here.</p>-->
                    <!--          </blockquote>-->
                    <!--          <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>-->
                    <!--          <h3>Example lists</h3>-->
                    <!--          <p>This is some additional paragraph placeholder content. It's a slightly shorter version of the other highly repetitive body text used throughout. This is an example unordered list:</p>-->
                    <!--          <ul>-->
                    <!--            <li>First list item</li>-->
                    <!--            <li>Second list item with a longer description</li>-->
                    <!--            <li>Third list item to close it out</li>-->
                    <!--          </ul>-->
                    <!--          <p>And this is an ordered list:</p>-->
                    <!--          <ol>-->
                    <!--            <li>First list item</li>-->
                    <!--            <li>Second list item with a longer description</li>-->
                    <!--            <li>Third list item to close it out</li>-->
                    <!--          </ol>-->
                    <!--          <p>And this is a definition list:</p>-->
                    <!--          <dl>-->
                    <!--            <dt>HyperText Markup Language (HTML)</dt>-->
                    <!--            <dd>The language used to describe and define the content of a Web page</dd>-->
                    <!--            <dt>Cascading Style Sheets (CSS)</dt>-->
                    <!--            <dd>Used to describe the appearance of Web content</dd>-->
                    <!--            <dt>JavaScript (JS)</dt>-->
                    <!--            <dd>The programming language used to build advanced Web sites and applications</dd>-->
                    <!--          </dl>-->
                    <!--          <h2>Inline HTML elements</h2>-->
                    <!--          <p>HTML defines a long list of available inline tags, a complete list of which can be found on the <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element">Mozilla Developer Network</a>.</p>-->
                    <!--          <ul>-->
                    <!--            <li><strong>To bold text</strong>, use <code class="language-plaintext highlighter-rouge">&lt;strong&gt;</code>.</li>-->
                    <!--            <li><em>To italicize text</em>, use <code class="language-plaintext highlighter-rouge">&lt;em&gt;</code>.</li>-->
                    <!--            <li>Abbreviations, like <abbr title="HyperText Markup Langage">HTML</abbr> should use <code class="language-plaintext highlighter-rouge">&lt;abbr&gt;</code>, with an optional <code class="language-plaintext highlighter-rouge">title</code> attribute for the full phrase.</li>-->
                    <!--            <li>Citations, like <cite>— Mark Otto</cite>, should use <code class="language-plaintext highlighter-rouge">&lt;cite&gt;</code>.</li>-->
                    <!--            <li><del>Deleted</del> text should use <code class="language-plaintext highlighter-rouge">&lt;del&gt;</code> and <ins>inserted</ins> text should use <code class="language-plaintext highlighter-rouge">&lt;ins&gt;</code>.</li>-->
                    <!--            <li>Superscript <sup>text</sup> uses <code class="language-plaintext highlighter-rouge">&lt;sup&gt;</code> and subscript <sub>text</sub> uses <code class="language-plaintext highlighter-rouge">&lt;sub&gt;</code>.</li>-->
                    <!--          </ul>-->
                    <!--          <p>Most of these elements are styled by browsers with few modifications on our part.</p>-->
                    <!--          <h2>Heading</h2>-->
                    <!--          <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>-->
                    <!--          <h3>Sub-heading</h3>-->
                    <!--          <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>-->
                    <!--          <pre><code>Example code block</code></pre>-->
                    <!--          <p>This is some additional paragraph placeholder content. It's a slightly shorter version of the other highly repetitive body text used throughout.</p>-->
                    <!--       -->
                </div>
                <div id="text">
                    <%
                        dao.io.ReadText readText=new dao.io.ReadText(articles.get(0).getTextPath());
                        //out.print(readText.readAll());
                        String s;
                        do {
                            s=readText.readLine();
                            out.print("<p>"+s+"</p>");
                        }while (s!=null);
                    %>
                </div>

            </article>
            <div>
                <!--  <article class="blog-post">-->
                <!--    <h2 class="blog-post-title">Another blog post</h2>-->
                <!--    <p class="blog-post-meta">December 23, 2020 by <a href="#">Jacob</a></p>-->

                <!--    <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>-->
                <!--    <blockquote>-->
                <!--      <p>Longer quote goes here, maybe with some <strong>emphasized text</strong> in the middle of it.</p>-->
                <!--    </blockquote>-->
                <!--    <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>-->
                <!--    <h3>Example table</h3>-->
                <!--    <p>And don't forget about tables in these posts:</p>-->
                <!--    <table class="table">-->
                <!--      <thead>-->
                <!--      <tr>-->
                <!--        <th>Name</th>-->
                <!--        <th>Upvotes</th>-->
                <!--        <th>Downvotes</th>-->
                <!--      </tr>-->
                <!--      </thead>-->
                <!--      <tbody>-->
                <!--      <tr>-->
                <!--        <td>Alice</td>-->
                <!--        <td>10</td>-->
                <!--        <td>11</td>-->
                <!--      </tr>-->
                <!--      <tr>-->
                <!--        <td>Bob</td>-->
                <!--        <td>4</td>-->
                <!--        <td>3</td>-->
                <!--      </tr>-->
                <!--      <tr>-->
                <!--        <td>Charlie</td>-->
                <!--        <td>7</td>-->
                <!--        <td>9</td>-->
                <!--      </tr>-->
                <!--      </tbody>-->
                <!--      <tfoot>-->
                <!--      <tr>-->
                <!--        <td>Totals</td>-->
                <!--        <td>21</td>-->
                <!--        <td>23</td>-->
                <!--      </tr>-->
                <!--      </tfoot>-->
                <!--    </table>-->

                <!--    <p>This is some additional paragraph placeholder content. It's a slightly shorter version of the other highly repetitive body text used throughout.</p>-->
                <!--  </article>-->

                <!--  <article class="blog-post">-->
                <!--    <h2 class="blog-post-title">New feature</h2>-->
                <!--    <p class="blog-post-meta">December 14, 2020 by <a href="#">Chris</a></p>-->

                <!--    <p>This is some additional paragraph placeholder content. It has been written to fill the available space and show how a longer snippet of text affects the surrounding content. We'll repeat it often to keep the demonstration flowing, so be on the lookout for this exact same string of text.</p>-->
                <!--    <ul>-->
                <!--      <li>First list item</li>-->
                <!--      <li>Second list item with a longer description</li>-->
                <!--      <li>Third list item to close it out</li>-->
                <!--    </ul>-->
                <!--    <p>This is some additional paragraph placeholder content. It's a slightly shorter version of the other highly repetitive body text used throughout.</p>-->
                <!--  </article>-->

                <!--  <nav class="blog-pagination" aria-label="Pagination">-->
                <!--    <a class="btn btn-outline-primary" href="#">Older</a>-->
                <!--    <a class="btn btn-outline-secondary disabled">Newer</a>-->
                <!--  </nav>-->
            </div>

        </div>

        <div class="col-md-3">
            <div class="position-sticky" style="top: 5rem;">
                <div class="p-4 mb-3 bg-light rounded">
                    <h4 class="fst-italic">About author</h4>
                    <p class="mb-0"><%=user.getUid()%></p>
                    <p class="mb-0"><%=user.getEmail()%></p>
                </div>

                <div class="p-4">
                    <h4 class="fst-italic">——————————</h4>
                    <ol class="list-group-horizontal list-unstyled mb-0">
                        <li><a href="javascript:" id="a-collect" onclick="collect('img-collect-white','img-collect-active','collect-num')" style="width: 60px;height: 48px">
                            <span id="collect-num" style="font-size: 16px" ><%=articles.get(0).getCollect()%></span>
                            <img class="img-collect" width="48" height="48" id="img-collect-white" style="display: block" src="../../image/newCollectWhite.png" alt="">
                            <img class="img-collect" width="48" height="48" id="img-collect-active" style="display: none" src="../../image/newCollectActive.png" alt="">
                        </a></li>
                        <li><a href="javascript:" id="a-heart" onclick="collect('img-heart-white','img-heart-active','heart-num')" style="width: 60px;height: 48px">
                            <span id="heart-num" style="font-size: 16px" ><%=articles.get(0).getLikeText()%></span>
                            <img class="img-collect" width="48" height="48" id="img-heart-white" style="display: block" src="../../image/newHeart2021White.png" alt="">
                            <img class="img-collect" width="48" height="48" id="img-heart-active" style="display: none" src="../../image/newHeart2021Active.png" alt="">
                        </a></li>
                        <li><a href="#">back to top</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    function collect(whites,actives,nums){
        const white = document.getElementById(whites);
        const active = document.getElementById(actives);
        const num=document.getElementById(nums);
        if (white.style.display === 'block') {
            white.style.display='none';
            active.style.display='block';
            num.innerText=(Number.parseInt(num.innerText,10)+1).toString(10);
        }else {
            white.style.display='block';
            active.style.display='none';
            num.innerText=(Number.parseInt(num.innerText,10)-1).toString(10);
        }
    }
</script>
<footer class="blog-footer justify-content-center">
    <p>Blog template built for <a href="${pageContext.request.contextPath}/index.jsp">xct</a> by <a href="https://twitter.com/mdo">xct</a>.</p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>





<script>
    (function() {
        var ws = new WebSocket('ws://' + window.location.host + '/jb-server-page?reloadServiceClientId=4');
        ws.onmessage = function (msg) {
            if (msg.data === 'reload') {
                window.location.reload();
            }
            if (msg.data.startsWith('update-css ')) {
                var messageId = msg.data.substring(11);
                var links = document.getElementsByTagName('link');
                for (var i = 0; i < links.length; i++) {
                    var link = links[i];
                    if (link.rel !== 'stylesheet') continue;
                    var clonedLink = link.cloneNode(true);
                    var newHref = link.href.replace(/(&|\?)jbUpdateLinksId=\d+/, "$1jbUpdateLinksId=" + messageId);
                    if (newHref !== link.href) {
                        clonedLink.href = newHref;
                    }
                    else {
                        var indexOfQuest = newHref.indexOf('?');
                        if (indexOfQuest >= 0) {
                            // to support ?foo#hash
                            clonedLink.href = newHref.substring(0, indexOfQuest + 1) + 'jbUpdateLinksId=' + messageId + '&' +
                                newHref.substring(indexOfQuest + 1);
                        }
                        else {
                            clonedLink.href += '?' + 'jbUpdateLinksId=' + messageId;
                        }
                    }
                    link.replaceWith(clonedLink);
                }
            }
        };
    })();
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
