<%--
  Created by IntelliJ IDEA.
  User: JingNi
  Date: 2021/6/4
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛--注册</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/register.css"/>
</head>

<body>
<form method="post" action="addOne" id="form1">
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
        <p> &gt;&gt;<a href="index.jsp?name=<%=name%>">论坛首页</a></p>
    </div>
    <table>
        <tr>
            <td colspan="5">用户名：
                <input type="text" name="uName" class="txt" style="margin-left: 1em;" id="name"/>
            </td>
        </tr>
        <tr>
            <td><span style="letter-spacing: 1em;">密</span>码：
                <input type="password" name="uPass" class="txt" style="margin-left: 1em;" id="pass"/>
            </td>
        </tr>
        <tr>
            <td colspan="5">重复密码：
                <input type="password" name="repPass" class="txt" id="repPass"/>
            </td>
        </tr>
        <tr>
            <td colspan="5">性别：&nbsp;
                女&nbsp;<input name="gender" type="radio" value="1"/>
                男&nbsp;<input name="gender" type="radio" value="2"/>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <table class="headTable">
                    <caption>
                        <p style="font-weight: bold;margin: 10px 0;">请选择头像</p>
                    </caption>
                    <tr>
                        <td><img src="pic/3_03.png" height="90" width="90"/><input name="head" type="radio" value="hp01"/></td>
                        <td><img src="pic/3_05.png" height="90" width="90"/><input name="head" type="radio" value="hp02"/></td>
                        <td><img src="pic/3_07.png" height="90" width="90"/><input name="head" type="radio" value="hp03"/></td>
                        <td><img src="pic/3_09.png" height="90" width="90"/><input name="head" type="radio" value="hp04"/></td>
                        <td><img src="pic/3_11.png" height="90" width="90"/><input name="head" type="radio" value="hp05"/></td>
                    </tr>
                    <tr>
                        <td><img src="pic/3_03.png" height="90" width="90"/><input name="head" type="radio" value="hp06"/></td>
                        <td><img src="pic/3_05.png" height="90" width="90"/><input name="head" type="radio" value="hp07"/></td>
                        <td><img src="pic/3_07.png" height="90" width="90"/><input name="head" type="radio" value="hp08"/></td>
                        <td><img src="pic/3_09.png" height="90" width="90"/><input name="head" type="radio" value="hp09"/></td>
                        <td><img src="pic/3_11.png" height="90" width="90"/><input name="head" type="radio" value="hp10"/></td>
                    </tr>
                    <tr>
                        <td><img src="pic/3_03.png" height="90" width="90"/><input name="head" type="radio" value="hp11"/></td>
                        <td><img src="pic/3_05.png" height="90" width="90"/><input name="head" type="radio" value="hp12"/></td>
                        <td><img src="pic/3_07.png" height="90" width="90"/><input name="head" type="radio" value="hp13"/></td>
                        <td><img src="pic/3_09.png" height="90" width="90"/><input name="head" type="radio" value="hp14"/></td>
                        <td><img src="pic/3_11.png" height="90" width="90"/><input name="head" type="radio" value="hp15"/></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr><td colspan="5"><input type="submit" value="注册" class="submit" id="btnSubmit"/> </td></tr>
    </table>
    <h6>版权所有</h6>
</form>
</body>
<script type="text/javascript">
    btnSubmit.onclick=function (){
        var sex=document.getElementsByName('gender');

        if (form1.name.value==="") {
            alert("请输入用户名，用户名不能为空！");
            return false;
        }else if (form1.pass.value===""){
            alert("请输入密码，密码不能为空！");
            return false;
        }else if (form1.repPass.value===""){
            alert("请输入重复密码，重复密码不能为空！");
            return false;
        }else if (form1.pass.value!==form1.repPass.value){
            alert("密码不一致，请重新输入！！");
            return false;
        }else if (!sex[0].checked && !sex[1].checked){
            alert('未选择性别');
            return false;
        }else {
            return true;
        }
    }
</script>
</html>
