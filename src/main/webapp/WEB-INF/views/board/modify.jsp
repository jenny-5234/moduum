<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-06-17
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시글 수정</title>
</head>
<body>
<div class="box-header">
    <h3 class="box-title">게시판 수정</h3>
</div>
<form name="modify-form" method="post" action="/board/update.do">
    <div class="box">
        <div>제목<input name="B_Title" id="B_Title" size="40" value="${boardDto.b_Title}"></div>
<%--        <div>비밀번호<input name="B_Password" id="B_Password" size="15" value="${boardDto.b_Title}"></div>--%>
        <div>이름<input name="B_Writer" id="B_Writer"value="${boardDto.b_Writer}"></div>
        <div>내용<textarea name="B_Context" id="B_Context" rows="8" cols="80" value="${boardDto.b_Context}></textarea></div>

        <div style="">
                <button type="submit">수정</button>
    </div>
</form>
</body>
</html>
