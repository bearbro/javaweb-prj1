<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>�û���¼ҳ��</title>
</head>
<!-- У���û��������� -->
<script language="JavaScript" type="application/javascript">
    /**
     * @return {boolean}
     */
    function CheckForm() {
        var name = document.getElementsByName("username")[0].value;
        if (name === "") {
            alert('�û������Ȳ���Ϊ��');
            return false;
        }
        if (name.length > 6) {
            alert('�û������Ȳ��ܳ���6λ');
            return false;
        }
        var pswd = document.getElementsByName("password")[0].value;
        if (pswd === "") {
            alert('���벻��Ϊ��');
            return false;
        }
        if (pswd.length > 6) {
            alert('���볤�Ȳ��ܳ���6λ');
            return false;
        }
    }
</script>
<body>
<form action="${pageContext.request.contextPath}/login" method="post" onSubmit="return CheckForm();">
    <!--���ύǰ������У�麯�� -->
    <table><!--��ӱ��ʹ����-->
        <tr>
            <td>���ͣ�</td>
            <td>
                <select name="type">
                    <option value="2">��ͨ�û�</option>
                    <option value="1">����Ա</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>�������û�����</td>
            <td><label>
                <input name="username" type="text">
            </label></td>
        </tr>
        <tr>
            <td>���������룺</td>
            <td><input name="password" type="password"></td>
        </tr>

        <tr>
            <td  align="right">
                <input type="submit" value="��¼">
            </td>
            <td>
            <input type="button" value="ע��" onclick="window.location.href='register.jsp'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>