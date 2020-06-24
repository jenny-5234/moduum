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
        <div>
            글번호 : <input name="BoardId" value="${boardDto.boardId}" type="text" readonly="readonly"/>
        </div>
        <div>
            작성일자 : ${boardDto.b_Date}
        <div>
            조회수 : ${boardDto.b_Count}
        </div>
        <div>
            제목
            <input name="title" id="b_Title" value="${boardDto.b_Title}"/>
        </div>
        <div>
            내용
            <textarea name="context" rows="5" >${boardDto.b_Context}</textarea>
        </div>
        <div>
            이름
            <input name="writer" id="b_Writer" value="${boardDto.b_Writer}" readonly="readonly"/>
        </div>

    <div style="">
                <button type="submit">수정</button>
    </div>
</form>
</body>
</html>
