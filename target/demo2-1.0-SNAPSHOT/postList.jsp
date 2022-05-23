<%@ page import="com.example.demo2.entity.Topic" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo2.controller.ListController" %><%--
  Created by IntelliJ IDEA.
  User: JingNi
  Date: 2021/6/4
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛--帖子列表</title>
</head>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/postList.css"/>
<body>
<form method="post" action="">
    <div class="loginLine">
        <p>
            <%
                String name = request.getParameter("name");
                String boardId= request.getParameter("boardId");
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
            <a href="login.jsp" id="aLogin">登录</a>&nbsp;<span style="color: #000;"> |</span>&nbsp;&nbsp;
            <a href="register.jsp"> 注册</a>&nbsp;<span style="color: #000;"> |</span>
            <%
                }
            %>
        </p>
    </div>
    <div id="guide">
        <p>&gt;&gt;<a href="index.jsp?name=<%=name%>">论坛首页</a>&gt;&gt;<a href="selTopicAll?name=<%=name%>">娱乐一</a></p>
    </div>
    <button class="post"><a href="editPost.jsp?name=<%=name%>&boardId=<%=boardId%>" id="btnEdit">发表话题</a></button>
    <button class="post"><a href="selView?name=<%=name%>">话题详情</a></button>

    <p class="page">
        <a href="nextList" class="page" style="margin-right: 15px;">下一页</a>|
        <a href="previousList" class="page">上一页</a>
    </p>

    <table style="border-collapse: collapse;" id="senfe"><%-- 设置表格的id--%>
        <tr>
            <td colspan="4" class="loginLine" style="height: 36px;"></td>
        </tr>
        <tr class="headline">
            <td colspan="2" style="width: 80%;">文章</td>
            <td style="width: 10%;">作者</td>
            <td style="width: 10%;">回复</td>
        </tr>
        <%-- 设置tbody的id--%>
        <tbody id="group_one">
            <%
                List<Topic> list = (List<Topic>) request.getAttribute("list");
               for (Topic topic : list) {
            %>
            <tr class="contentLine">
                <td style="width: 2%;padding: 5px;"><img src="pic/02.png" height="21" width="18" alt="这是文章"/></td>
                <td style="width: 78%;">
                    <%=topic.getTitle()%>
                </td>
                <td style="width: 10%;">
                    <%=topic.getUserName().getuName()%>
                </td>
                <td style="width: 10%;">0</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%--控制表格底端分页设置文本--%>
    <div class="page" style="margin: 10px;text-align: center;">
        <a href="selTopicAll" class="page">首 页</a>/
        <a href="nextList" class="page">下一页</a>/
        <a href="previousList" class="page">上一页</a>/
        <a href="lastList" class="page">末 页</a>
        /当前：第<span style="font-weight: bold;color: black;padding: 0 5px;"><%=request.getAttribute("cP")%></span>页/
        <button id="btn" value="submit" style="width: 100px;background-color: #ffffff;padding: 10px;"><a id="link" class="page">点击跳转</a></button>
        到：第<input id="naviPage" value="1" style="width:30px;border: 1px solid #4faae5;"/>页/
        总页数：<%=request.getAttribute("allPage")%>
    </div>
    <h6>版权所有</h6>
</form>
</body>
<script type="text/javascript">
    /*判断跳转时是否登录*/
   window.onload = function () {
        btnEdit.onclick = function () {
            //confirm("请先登录！！！");/*confirm有确定和取消*/
            if (aLogin.toString() !== "") {
                alert("您还没有登录，请登录...");/*alert只有确定*/
                return false;
            } else {
                return true;
            }
        }
    }
    /*输入页数跳转列表页*/
    btn.onclick=function (){
        var inp=document.getElementById("naviPage");
        var allPage='<%=request.getAttribute("allPage")%>';

        if (inp.value===""){
            alert("请输入页数，页数不能为空！");
            return false;
        }else if (inp.value<1){
            alert("页数不能小于1！");
            return false;
        }else if (inp.value>allPage){
            alert("页数不能大于总页数！");
            return false;
        }else {
            var link=document.getElementById("link");
            link.href="navigationList?naviPage="+inp.value;
        }

    }

</script>
</html>
