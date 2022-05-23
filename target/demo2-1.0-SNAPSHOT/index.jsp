<%@ page import="java.util.List" %>
<%@ page import="com.example.demo2.entity.Board" %>
<%@ page import="com.example.demo2.dao.BaseDao" %>
<%@ page import="com.example.demo2.dao.BoardDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>欢迎访问我的论坛</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
<form method="post" action="">
    <div class="loginLine">
        <p>
            <%
                String name = (String) request.getAttribute("name");
                if (name != null && !name.equals("")) {
            %>
            <h8>您好：&nbsp;&nbsp;</h8>
            <%
                out.print(name);
            %>
            <h8>&nbsp;|&nbsp;&nbsp;<a href="login.jsp">登出</a>&nbsp;|</h8>
            <%
            } else {
                name = request.getParameter("name");
                if (name != null && !name.equals("null")) {
            %>
            <h8>您好：&nbsp;&nbsp;</h8>
            <%
                out.print(name);
            %>
            <h8>&nbsp;|&nbsp;&nbsp;<a href="login.jsp">登出</a>&nbsp;|</h8>
            <%
            } else {
            %>
            您尚未 &nbsp;&nbsp;
            <a href="login.jsp">登录</a>&nbsp;<span style="color: #000;"> |</span>&nbsp;&nbsp;
            <a href="register.jsp"> 注册</a>&nbsp;<span style="color: #000;"> |</span>
            <%
                    }
                }
            %>
        </p>
    </div>
    <table>
        <tr class="headline">
            <td style="width: 5%;"></td>
            <td style="width: 60%">论坛</td>
            <td style="width: 5%;">主题</td>
            <td style="width: 30%;">最后发表</td>
        </tr>
        <tr class="title">
            <td>娱乐：</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <%
            BoardDaoImpl boardDaoImpl = new BoardDaoImpl();
            List<Board> boardList= boardDaoImpl.selBoardAll();
            for (int i=0;i<=boardList.size()-2;i++){
                Board board= boardList.get(i);
        %>
        <tr class="fun">
            <td class="unit"></td>
            <td class="unit">
                <img src="pic/01.png" height="27" width="22"/>
                <a href="selTopicAll?name=<%=name%>&boardId=<%=board.getBoardId()%>"><%=board.getBoardName()%></a>
            </td>
            <td class="unit">0</td>
            <td class="unit">null <br/><span style="color: #000;">null</span> &nbsp;[2021-05-30 13:35:31]</td>
        </tr>
        <%
            }
        %>
        <tr class="title">
            <td>新闻：</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="fun">
            <td></td>
            <td>
                <img src="pic/01.png" height="27" width="22"/>
                <a href="selTopicAll?name=<%=name%>%>">新闻一</a>
            </td>
            <td>0</td>
            <td>null <br/><span style="color: #000;">null</span> &nbsp;[2021-05-30 13:35:31]</td>
        </tr>
        <tr class="fun">
            <td></td>
            <td>
                <img src="pic/01.png" height="27" width="22"/>
                <a href="selTopicAll?name=<%=name%>">新闻二</a>
            </td>
            <td>0</td>
            <td>null <br/><span style="color: #000;">null</span> &nbsp;[2021-05-30 13:35:31]</td>
        </tr>
    </table>
</form>
<h6>版权所有</h6>
</body>
</html>