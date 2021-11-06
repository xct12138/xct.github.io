<%--
  Created by IntelliJ IDEA.
  User: xct
  Date: 2021/11/6
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="../../image/logo1.png">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/signinStyle.css">
</head>
<body>
<div class="container" id=".container">
    <div class="container_from container--signup">
        <form method="post" action="${pageContext.request.contextPath}/signup" class="from" id="form1">
            <h2 class="form_title">注册</h2>
            <label>
                <input class="input" name="upUname" placeholder="User name" type="text" required>
                <input class="input" name="upPassword" placeholder="password" type="password" required>
                <input class="input" name="email" placeholder="Email" type="email">
            </label>
            <%
                Boolean signupResult=(Boolean) request.getAttribute("signupResult");
                if (signupResult!=null && !signupResult) {
                    Boolean isRepeat = (Boolean) request.getAttribute("isRepeat");
                    if (isRepeat!=null ) {
                        if (isRepeat) {
                            out.print("<div style=\"color:red;\">用户名重复，注册失败！</div>");
                        } else out.print("<div style=\"color:red;\">注册失败！</div>");
                    }
                }
            %>
            <input name="tj" class="btn" value="注册" type="submit">
        </form>
    </div>
    <div class="container_from container--signin">
        <form method="post" action="${pageContext.request.contextPath}/signin" class="from" id="form2">
            <h2 class="form_title">登录</h2>
            <label>
                <input class="input" name="uname" placeholder="name/email" type="text" required>
                <input class="input" name="password" placeholder="password" type="password" required>
            </label>
            <a href="#" class="link">忘记密码</a>
            <%
                Boolean loginResult=(Boolean) request.getAttribute("loginResult");
                if (loginResult!=null) {
                    if (!loginResult) out.print("<div style=\"color:red\">登录失败！</div>");
                }
            %>
            <input name="tj" type="submit" class="btn" value="登录">
        </form>
    </div>

    <div class="container_overlay">
        <div class="overlay">
            <div class="overlay_panel overlay--left">
                <button class="btn" id="signin">已有账号，直接登陆</button>
            </div>
            <div class="overlay_panel overlay--right">
                <button class="btn" id="signup">没有账号，注册</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/source/javascript/signin.js"></script>
</html>
