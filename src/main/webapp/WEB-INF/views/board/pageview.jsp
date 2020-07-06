<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-06-17
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%--<form role="form" method="post">--%>
<%--    <input type="" name="page" value="${boardDto.curPage}">--%>
<%--    <input type="" name="cntPerPage" value="${boardDto.cntPerPage}">--%>
<%--    <input type="hidden" nema="boardId" value="${boardDto.boardId}">--%>
<%--</form>--%>

<form name="viewForm" method="post" enctype="multipart/form-data">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">상세보기</h3>
        </div>
        <div>
            작성일자 : <fmt:formatDate value="${boardDto.b_Date}" pattern="yyyy-MM-dd"/>
        </div>
        <div>
            조회수 : ${boardDto.b_Count}
        </div>
        <div>
            제목
            <input name="title" id="B_Title" value="${boardDto.b_Title}" readonly="readonly"/>
        </div>
        <div>
            내용
            <textarea name="context" rows="5" readonly="readonly">${boardDto.b_Context}</textarea>
            <img src="${boardDto.b_FilePath}/${boardDto.b_FileName}"/>

        </div>

        <div>
            이름
            <input name="writer" id="B_Writer" value="${boardDto.b_Writer}" readonly="readonly"/>
        </div>
        <td>
            <button type="button" name="curPage" onclick="location.href='/board/boardlist?curPage=1'">목록</button>
            <button type="button" id="d_btn">삭제</button>
            <button type="button" id="m_btn">수정</button>
        </td>

    </div>
</form>
<script>
    $(function () {
        $('#d_btn').click(function () {
            var password = prompt("비밀번호")


            if (password == ${boardDto.b_Password}) {
                location.href = '/board/delete.do?boardId=${boardDto.boardId}'
            } else {
                alert("다시 입력해주세요")
            }
        })
    })

    $(function () {
        $('#m_btn').click(function () {
            var password = prompt("비밀번호")


            if (password == ${boardDto.b_Password}) {
                location.href = '/board/modify?boardId=${boardDto.boardId}'
            } else {
                alert("다시 입력해주세요")
            }
        })
    })
</script>
</body>
</html>
