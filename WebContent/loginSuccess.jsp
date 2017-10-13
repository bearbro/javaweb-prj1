<%@ page import="cn.edu.zjut.model.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Bro、小熊
  Date: 2017/10/1
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
<%
    UserBean user = (UserBean) request.getAttribute("USER");
%>
登录成功，欢迎您，<%=user.getUsername()%>!
</body>
</html>
