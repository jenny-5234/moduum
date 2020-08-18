<%--
  Created by IntelliJ IDEA.
  User: BIT
  Date: 2020-08-06
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin | 모둠전</title>
</head>
<body>
<% String admin = (String) session.getAttribute("adminid");%>

<%if (admin == null) { %>
<form action="/admin/login" method="post">
    <input type="text" name="adminid" id="adminid" placeholder="아이디">

    <input type="password" name="adminpwd" id="adminpwd" placeholder="비밀번호">

    <button type="submit">로그인</button>
</form>
<button type="button"  style="display: none;" onclick="<%session.invalidate();%> location.href='/'">로그아웃</button>

<%} else if (admin.equals("modumadmin")) { %>
<button type="button" onclick="<%session.invalidate();%> location.href='/'">로그아웃</button>

<% } else {%>
<button type="button" style="display: none;" onclick="<%session.invalidate();%> location.href='/'">로그아웃</button>
<% } %>
</body>
</html>
