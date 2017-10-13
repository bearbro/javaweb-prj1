<%--
  Created by IntelliJ IDEA.
  User: Bro、小熊
  Date: 2017/10/1
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<!-- 校验用户名及密码 -->
<script language="JavaScript" type="application/javascript">
    /**
     * @return {boolean}
     */
    function CheckForm() {
        var name = document.getElementsByName("username")[0].value;
        if (name === "") {
            alert('用户名长度不能为空');
            return false;
        }
        if (name.length > 6) {
            alert('用户名长度不能超过6位');
            return false;
        }
        var pswd = document.getElementsByName("password")[0].value;
        var pswd2 = document.getElementsByName("password2")[0].value;
        if (pswd === "") {
            alert('密码不能为空');
            return false;
        }
        if (pswd.length > 6) {
            alert('密码长度不能超过6位');
            return false;
        }
        if(pswd!=pswd2){
            alert('两次输入的密码不同！');
            return false;
        }
    }
</script>
<body>
<form action="register" method="post" onSubmit="return CheckForm();">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td>再次输入：</td>
            <td><input type="password" name="password2"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="注册并登录">&nbsp;
                <input type="button" value="返回登录界面" onclick="window.location.href='login.jsp'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
