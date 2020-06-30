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
    <link rel="stylesheet" href="/css/test.css"/>
</head>
<body>
<section id="Board">
    <table>
        <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>날짜</td>
            <td>조회수</td>
        </tr>
        <c:forEach var="dto" items="${board}" varStatus="status">
            <tr>
                <td>${status.index+1+(pagination.curPage-1)*10}</td>

                <td><a href="/board/pageview?BoardId=${dto.boardId}">${dto.b_Title}</a></td>

                <td>${dto.b_Writer}</td>
                <td>${dto.b_Date}</td>
                <td>${dto.b_Count}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="links">
        <c:if test="${pagination.curRange ne 1 }">
            <a href="#" onClick="fn_paging(1)">[처음]</a>
        </c:if>
        <c:if test="${pagination.curPage ne 1}">
            <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a>
        </c:if>
        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
            <c:choose>
                <c:when test="${pageNum eq  pagination.curPage}">
                    <span style="font-weight: bold;"><a href="#"
                                                        onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
                </c:when>
                <c:otherwise>
                    <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
            <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
        </c:if>
        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
            <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
        </c:if>
    </div>
    <div>
        총 게시글 수 : ${pagination.listCnt } / 총 페이지 수 : ${pagination.pageCnt }
        / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
    </div>

</section>
<a href="write">글쓰기</a>
<script>
    function fn_paging(curPage) {
        location.href = "/board/boardlist?curPage=" + curPage;
    }
</script>
</body>
</html>
