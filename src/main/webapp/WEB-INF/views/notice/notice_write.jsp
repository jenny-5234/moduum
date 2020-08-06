<%@ page import="java.io.File" %><%--
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.css">

    <title>글쓰기</title>

    <style>
        body{
            width: 90%;
            margin: 0 auto;
        }
        .container {
            margin: 0 auto;
            margin-top: 3%;
            margin-bottom: 3%;
            text-align: center;
            width: 80%;
        }

        .box-title {
            font-size: 1.5em;
            margin: 3%;
        }

        .formTable {
            width: 100%;
        }

        .label {
            border-radius: 10px;
            background-color: rgba(153, 197, 243, 0.5);
            width: 20%;
            padding: 7px;
        }

        .button {
            text-align: right;
            margin: 10px;
        }

        #saveBtn {
            padding: 2px;
            font-size: 15px;
            background-color: white;
            color: black;
            border: 2px solid dodgerblue;
            transition-duration: 0.4s;
        }

        #saveBtn:hover {
            background-color: dodgerblue;
            color: white;
        }

        .textbox {
            width: 100%;

        }

    </style>
</head>
<body>

<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>

<div class="container">
    <div class="box-header">
        <h3 class="box-title">글 작성하기</h3>
    </div>
    <form id="insert_Form" name="insert_Form" method="post" enctype="multipart/form-data" action="/notice/insert.do">
        <table class="formTable">
            <tr>
                <td class="label">작성자</td>
                <td><input class="form-control" maxlength="30" name="N_Writer" id="N_Writer" style="width: 100%;" placeholder="이름 입력"></td>
            </tr>
            <tr>
                <td class="label">비밀번호</td>
                <td><input class="form-control" name="N_Password" id="N_Password" style="width: 100%;" maxlength="15"
                           placeholder="비밀번호 입력"></td>
            </tr>
            <tr>
                <td class="label">제목</td>
                <td><input class="form-control" name="N_Title" id="N_Title" style="width: 100%;" maxlength="100" placeholder="글 제목 입력"></td>
            </tr>
        </table>
        <tr class="textbox">
                    <textarea name="N_Context" id="smartEditor" rows="10" cols="100"
                              style="width:100%; height:600px;">

                    </textarea>
        </tr>
    </form>
    <div class="button">
        <button type="button" id="saveBtn">확인</button>
    </div>
</div>

<footer>
    <jsp:include page="../footer.jsp"/>
</footer>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        // 전역변수 선언
        var oEditors = [];

        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
            sSkinURI: "/smarteditor2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
            fCreator: "createSEditor2",
            htParams: {
                // 툴바 사용 여부
                bUseToolbar: true,
                // 입력창 크기 조절바
                bUseVerticalResizer: true,
                // 모드탭
                bUseModeChanger: true,
                fOnBeforeUnload: function () {
                }
            }
        });
        $("#saveBtn").click(function () {
            oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);

            // 폼 유효성 검사
            var form = document.insert_Form;

            if (!form.N_Writer.value) {
                alert("이름을 입력해주세요");
                form.N_Writer.focus();
                return;
            }
            if (!form.N_Password.value) {
                alert("비밀번호를 입력해주세요");
                form.N_Password.focus();
                return;
            }
            if (!form.N_Title.value) {
                alert("제목을 입력해주세요");
                form.N_Title.focus();
                return;
            }
            if (!form.N_Context.value) {
                alert("내용을 입력해주세요");
                form.N_Context.focus();
                return;
            }
            $("#insert_Form").submit();
        });
    });

    var pasteHTML = function (filename) {                     //업로드한 사진을 화면에 보여주게 만드는 스크립트입니다.
        var sHTML = '<img src="${pageContext.request.contextPath}/image/uploadFile/' + filename + '">'; //사진이 저장된 경로입니다.
        oEditors.getById["smartEditor"].exec("PASTE_HTML", [sHTML]);
    };

</script>
</html>

