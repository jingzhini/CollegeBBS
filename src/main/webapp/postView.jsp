<%@ page import="com.example.demo2.entity.Topic" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2021/7/7
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛--看帖</title>
</head>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/postList.css"/>
<body>
<form method="post" action="navigationList">
    <div class="loginLine">
        <p>
            <%
                String name = request.getParameter("name");
                Topic topicView= (Topic) request.getAttribute("topicView");
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
    <button class="post"><a href="editPost.jsp?name=<%=name%>&boardId=<%=topicView.getBoardId()%>" id="btnEdit">发表话题</a></button>

    <table style="border-collapse: collapse;" id="senfe"><%-- 设置表格的id--%>
        <tr>
            <td colspan="4" class="loginLine" style="height: 36px;"><h3>本页主题：<%=topicView.getTitle()%></h3></td>
        </tr>
        <tr class="headline"></tr>
        <%-- 设置tbody的id--%>
        <tbody id="group_one">
        <tr class="contentLine">
            <td style="width: 20%;">
                <h3>Admin</h3>

            </td>
            <td style="width: 80%;">
                <h3><%=topicView.getTitle()%></h3>
                <p>&#12288;<%=topicView.getContent()%></p>
                <hr style="width:90%;border:0.5px solid #2f5fb6;background-color: #2f5fb6;"/>
                发表：<%=topicView.getPublishTime()%>&#12288;最后修改：<%=topicView.getModifyTime()%>
            </td>
        </tr>

        </tbody>
    </table>

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
