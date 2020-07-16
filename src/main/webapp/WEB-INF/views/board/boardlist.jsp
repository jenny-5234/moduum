<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-06-17
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>정보마당</title>
    <link rel="stylesheet" href="/css/boardCSS/boardlist.css"/>"/>
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <%--    <script src="/js/bootstrap.js"/>--%>

</head>
<body>

<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>

<div class="container">
    <div align="left">
        총 게시글 수 : ${pagination.listCnt }
    </div>
    <form id="Board">
        <table class="table table-hover">
            <tr class="mainlist">
                <td id="boardid">번호</td>
                <td id="title">제목</td>
                <td id="writer">작성자</td>
                <td id="date">날짜</td>
                <td id="count">조회수</td>
            </tr>

            <c:forEach var="dto" items="${board}" varStatus="status">
                <tr class="boardlist">
                    <td>${status.index+1+(pagination.curPage-1)*15}</td>

                    <td class="listTitle"
                        onclick="location.href='/board/pageview?BoardId=${dto.boardId}';">${dto.b_Title}</td>

                    <td>${dto.b_Writer}</td>
                    <td>${dto.b_Date}</td>
                    <td>${dto.b_Count}</td>
                </tr>
            </c:forEach>
        </table>

        <div class="paging">
            <ul class="pagination">
                <c:if test="${pagination.curPage ne 1}">
                    <li class="pagelist"><a onClick="fn_paging('${pagination.prevPage }')"><<</a></li>
                </c:if>
                <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                    <c:choose>
                        <c:when test="${pageNum eq  pagination.curPage}">
                            <li class="pagelist"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="pagelist"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                    <li class="pagelist"><a href="#" onClick="fn_paging('${pagination.nextPage }')">>></a></li>
                </c:if>
            </ul>
        </div>

    </form>
    <div class="button">
        <button type="button" id="write_btn" onclick="location.href='/board/write'">글쓰기</button>
    </div>
</div>
<script>
    function fn_paging(curPage) {
        location.href = "/board/boardlist?curPage=" + curPage;
    }
</script>
</body>
</html>