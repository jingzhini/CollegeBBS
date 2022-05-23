<%--
  Created by IntelliJ IDEA.
  User: JingNi
  Date: 2021/6/4
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛--编辑帖子</title>
    <link rel="stylesheet" type="text/css" href="css/editPost.css">
</head>
<body>
<form id="form1" method="post" action="addTopic">
    <div class="loginLine">
        <p>
            <%
                String name= request.getParameter("name");
                String boardId= request.getParameter("boardId");

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
        <p>&gt;&gt;<a href="index.jsp?name=<%=name%>">论坛首页</a>&gt;&gt;<a href="selTopicAll?name=<%=name%>">娱乐一</a></p>
    </div>
    <table>
        <tr><td colspan="2" class="loginLine" style="height: 36px;"><p>发表帖子</p></td></tr>
        <tr class="headline">
            <td style="width: 20%;"><p style="margin-bottom: 10px;">标题</p></td>
            <td style="width: 80%;"><input type="text" id="title" name="title" class="txt" style="width: 480px;height: 24px;"/></td>
        </tr>
        <tr class="headline">
            <td style="vertical-align: top;"><p>内容</p></td>
            <td>
                <textarea cols="80" rows="25" class="txt" id="content" name="content"></textarea><br/>
                （不能大于：<span style="color: #0000ff;">1000</span>字）
            </td>
        </tr>
    </table>
    <%-- 设置表单隐藏域，通过表单传boardId，name的值--%>
    <input type="hidden" name="boardId" value="<%=boardId%>"/>
    <input type="hidden" name="name"  value="<%=name%>"/>
    <div style=" text-align: center;">
        <button id="btnSubmit" value="提交" class="button">提交</button>
        <button id="btnReset" value="重置" class="button">重置</button>
    </div>
    <h6>版权所有</h6>
</form>
<script type="text/javascript">
    /*var btnSubmit=document.getElementById("btnSubmit");
    var title=document.getElementById("title");
    btnSubmit.onclick=function () {

        if (title.value.length===0){
            alert("请输入标题，标题不能为空！");
            return false;
        }
    }*/
    btnSubmit.onclick=function (){
        if (form1.title.value==="") {
            alert("请输入标题，标题不能为空！");
            return false;
        }else if (form1.content.value===""){
            alert("请输入正文，正文不能为空！");
            return false;
        }else {
            return true;
        }
    }
    btnReset.onclick=function (){
        var reset=confirm("是否重置？");
        if (reset){
            form1.title.value="";
            form1.content.value="";
            return false;
        }else{
            return false;
        }
    }
</script>
</body>
</html>
