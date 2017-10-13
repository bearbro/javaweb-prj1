<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>用户登录页面</title>
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
        if (pswd === "") {
            alert('密码不能为空');
            return false;
        }
        if (pswd.length > 6) {
            alert('密码长度不能超过6位');
            return false;
        }
    }
</script>
<body>
<form action="${pageContext.request.contextPath}/login" method="post" onSubmit="return CheckForm();">
    <!--表单提交前先运行校验函数 -->
    <table><!--添加表格，使对齐-->
        <tr>
            <td>类型：</td>
            <td>
                <select name="type">
                    <option value="2">普通用户</option>
                    <option value="1">管理员</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>请输入用户名：</td>
            <td><label>
                <input name="username" type="text">
            </label></td>
        </tr>
        <tr>
            <td>请输入密码：</td>
            <td><input name="password" type="password"></td>
        </tr>

        <tr>
            <td  align="right">
                <input type="submit" value="登录">
            </td>
            <td>
            <input type="button" value="注册" onclick="window.location.href='register.jsp'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>