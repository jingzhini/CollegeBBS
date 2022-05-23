<%--
  Created by IntelliJ IDEA.
  User: JingNi
  Date: 2021/6/4
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛--登录</title>
</head>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/register.css"/>
<body>
<form method="post" action="selOne">
    <div class="loginLine">
        <p>
            <%
                String name= request.getParameter("name");
                if (name!=null&&!name.equals("null")){
            %>
            <h8>您好：&nbsp;&nbsp;</h8>
            <%
                out.print(name);
            %>
            <h8>&nbsp;|&nbsp;&nbsp;<a href="login.jsp">登出</a>&nbsp;|</h8>
            <%
                } else{
            %>
            您尚未 &nbsp;&nbsp;
            <a href="login.jsp">登录</a>&nbsp;<span style="color: #000;"> |</span>&nbsp;&nbsp;
            <a href="register.jsp"> 注册</a>&nbsp;<span style="color: #000;"> |</span>
            <%
                }
            %>
        </p>
    </div>
    <div id="guide">
        <p><a href="index.jsp?name=<%=name%>">>>论坛首页</a></p>
    </div>
    <table>
        <tr>
            <td>用户名：
                <input type="text" name="lName" class="txt" style="margin-left: 1em;"/>
            </td>
        </tr>
        <tr>
            <td><span style="letter-spacing: 1em;">密</span>码：
                <input type="password" name="lPass" class="txt" style="margin-left: 1em;"/>
            </td>
        </tr>
        <tr><td><input type="submit" value="登录" class="submit"/> </td></tr>
    </table>
    <h6>版权所有</h6>
</form>
</body>
</html>
