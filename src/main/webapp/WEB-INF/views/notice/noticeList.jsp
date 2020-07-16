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
    <link rel="stylesheet" href="/css/bootstrap.css">
    <%--    <script src="/js/bootstrap.js"/>--%>
    <style>
        body {
            width: 90%;
            margin: 0 auto;
        }

        .container {
            margin-top: 5%;
            margin-bottom: 3%;
            width: 70%;
            height: auto;
        }

        .mainlist {
            text-align: center;
            font-size: 15px;
            background: #ebf2f8;
            font-weight: bold;
        }

        td[id="boardid"] {
            width: 10%;
        }

        td[id="title"] {
            width: 60%;
        }

        td[id="writer"] {
            width: 10%;
        }

        td[id="date"] {
            width: 10%;
        }

        td[id="count"] {
            width: 10%;
        }

        tr[class="boardlist"] {
            text-align: center;
        }

        tr[class="boardlist"] td[class="listTitle"] {
            text-align: left;
        }

        .paging {
            margin: 0 auto;
            text-align: center;
            width: 50%;
        }

        .pagination {
            list-style: none;
            display: inline-block;
            padding: 0;
            margin-top: 20px;
        }

        .pagelist {
            color: black;
            float: left;
            display: block;
            text-align: center;
        }

        .pagelist a {
            float: left;
            display: block;
            padding: 5px 12px;
            border-radius: 50%;
            margin: 0 5px;
            background-color: aliceblue;
            text-decoration: none;
        }

        .pagelist a:hover {
            outline: none;
            background: cornflowerblue;
        }

        .pagelist a:active {
            background-color: red;
        }

        .button {
            text-align: right;
            margin: 10px;
        }

        #write_btn {
            padding: 2px;
            font-size: 15px;
            background-color: white;
            color: black;
            border: 2px solid dodgerblue;
            transition-duration: 0.4s;
        }

        #write_btn:hover {
            background-color: dodgerblue;
            color: white;
        }

    </style>
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
                <td id="noticeid">번호</td>
                <td id="title">제목</td>
                <td id="writer">작성자</td>
                <td id="date">날짜</td>
                <td id="count">조회수</td>
            </tr>

            <c:forEach var="dto" items="${notice}" varStatus="status">
                <tr class="noticelist">
                    <td>${status.index+1+(pagination.curPage-1)*15}</td>

                    <td class="listTitle"
                        onclick="location.href='/notice/noticeview?NoticeId=${dto.noticeId}';">${dto.n_Title}</td>

                    <td>${dto.n_Writer}</td>
                    <td>${dto.n_Date}</td>
                    <td>${dto.n_Count}</td>
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
        <button type="button" id="write_btn">글쓰기</button>
    </div>
</div>
<script>
    function fn_paging(curPage) {
        location.href = "/notice/noticeList?curPage=" + curPage;
    }

    $(function () {
        $('#write_btn').click(function () {

            var password = prompt("비밀번호를 입력해주세요")

            if (password == 'admin') {
                location.href = '/notice/notice_write';
            } else {
                alert("권한이 없습니다.")
            }
        })
    })

</script>
</body>
</html>