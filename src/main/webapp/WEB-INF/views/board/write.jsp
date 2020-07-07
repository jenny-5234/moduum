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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
    <%--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

    <title>글쓰기</title>
    <style>
        .container {
            margin-top: 3%;
            margin-bottom: 3%;
            text-align: center;
        }
        #insert_Form {
            width: 100%;
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
    <form id=insert_Form" method="post" enctype="multipart/form-data" action="/board/insert.do">
        <table class="insert-form">
            <tr>
                <td>
                    제목<input name="B_Title" id="B_Title" size="40" placeholder="글 제목 입력"></td>
            </tr>
            <tr>
                <td>비밀번호<input name="B_Password" id="B_Password" size="15" placeholder="비밀번호 입력"></td>
            </tr>
            <tr>
                <td>이름<input name="B_Writer" id="B_Writer" placeholder="이름 입력"></td>
            </tr>
            <tr>
                <td>내용
                    <textarea class="form-control" id="smartEditor" name="content">
            </textarea>
                    <script type="text/javascript">
                        var oEditors = [];
                        nhn.husky.EZCreator.createInIFrame({
                            oAppRef: oEditors,
                            elPlaceHolder: "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
                            sSkinURI: "/smarteditor2/SmartEditor2Skin.html"
                        }) //경로를 꼭 맞춰주세요!
                    </script>
                </td>
            </tr>
            <tr>
                <td> 파일 <input type="file" name="file" id="file"></td>
            </tr>
            <tr>
                <td><input type="button" id="save" value="확인"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

