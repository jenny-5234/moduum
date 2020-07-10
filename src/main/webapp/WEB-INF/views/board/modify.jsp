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
    <script src="/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>게시글 수정</title>

    <style>
        .container {
            margin: 0 auto;
            margin-top: 3%;
            margin-bottom: 3%;
            /*text-align: center;*/
            width: 80%;
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
    <div class="box-header">
        <h3 class="box-title">게시판 수정</h3>
    </div>
    <form name="modify-form" method="post" enctype="multipart/form-data" action="/board/update.do">
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
                    <input name="B_Title" id="b_Title" value="${boardDto.b_Title}"/>
                </div>
                <div>
                    내용
                    <%--            <textarea name="B_Context" rows="5" >${boardDto.b_Context}</textarea>--%>
                    <textarea name="B_Context" id="smartEditor" rows="10" cols="100"
                              style="width:100%; height:412px;"> ${boardDto.b_Context} </textarea>
                </div>

                <div>
                    이름
                    <input name="writer" id="b_Writer" value="${boardDto.b_Writer}" readonly="readonly"/>
                </div>

                <div style="">
                    <input type="button" id="modifyBtn" value="수정하기"/>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var oEditors = [];

        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
            sSkinURI: "/smarteditor2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
            fCreator: "createSEditor2",
            htParams: {
                bUseToolbar: true,
                bUseVerticalResizer: true,
                bUseModeChanger: true,
                fOnBeforeUnload: function () {
                }
            }
        });
        $("#modifyBtn").click(function () {
            oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
            oEditors.getById["smartEditor"].exec("LOAD_CONTENTS_FIELD");
            $("#modify-form").submit();

        });
    });

    var pasteHTML = function (filename) {                     //업로드한 사진을 화면에 보여주게 만드는 스크립트입니다.
        var sHTML = '<img src="${pageContext.request.contextPath}/image/uploadFile/' + filename + '">'; //사진이 저장된 경로입니다.
        oEditors.getById["smartEditor"].exec("PASTE_HTML", [sHTML]);
    };
</script>
</body>
</html>
