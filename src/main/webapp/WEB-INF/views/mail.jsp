<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-07-15
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>피드백페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<div class="container">
    <h4>메일 보내기</h4>
    <form action="${pageContext.request.contextPath}/mail/mailSending" method="post">
        <div align="center"><!-- 받는 사람 이메일 -->
            <input type="text" name="tomail" size="120" style="width:100%" placeholder="상대의 이메일" class="form-control" >
        </div>
        <div align="center"><!-- 제목 -->
            <input type="text" name="title" size="120" style="width:100%" placeholder="제목을 입력해주세요" class="form-control" >
        </div>
        <p>
        <div align="center"><!-- 내용 -->
            <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용#" class="form-control"></textarea>
        </div>
        <p>
        <div align="center">
            <input type="submit" value="메일 보내기" class="btn btn-warning">
        </div>
    </form>
</div>
</body>
</html>
