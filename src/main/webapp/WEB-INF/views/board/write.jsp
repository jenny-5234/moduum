<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-06-17
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글쓰기</title>
    <style>
        .container {
            margin-top: 3%;
            margin-bottom: 3%;
            margin: 0 auto;
            width: 80%;
            height: auto;
        }

        table[class=insert-form] {
            border-collapse: separate;
            border-spacing: 1px;
            text-align: left;
            line-height: 1.5;
            margin: 20px 10px;
        }

        table[class=insert-form] tr {
            width: 100px;
            padding: 10px;
            vertical-align: top;
        }

        table[class=insert-form] td {
            width: 100px;
            padding: 10px;
            vertical-align: top;
        }

        #submit_btn {
            text-align: right;

        }

    </style>
</head>
<body>
<header>
    <h1><a href="#">모둠전</a></h1>
</header>
<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>

<div class="container">
    <form name="insert_Form" method="post" enctype="multipart/form-data" action="/board/insert.do">
        <table class="insert-form">
            <tr>
                <td>제목<input name="B_Title" id="B_Title" size="40" placeholder="글 제목 입력"></td>
            </tr>
            <tr>
                <td>비밀번호<input name="B_Password" id="B_Password" size="15" placeholder="비밀번호 입력"></td>
            </tr>
            <tr>
                <td>이름<input name="B_Writer" id="B_Writer" placeholder="이름 입력"></td>
            </tr>
            <tr>
                <td>내용<textarea name="B_Context" id="B_Context" rows="20" cols="100" placeholder="글 내용 입력"></textarea>
                </td>
            </tr>
            <tr>
                <td> 파일 <input type="file" name="file" id="file"></td>
            </tr>
        </table>
    </form>
    <div id=submit_btn>
        <input type="submit" value="확인">
    </div>

</div>
</body>
</html>
