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
    <link rel="stylesheet" href="/css/board/boardmodify.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <title>게시글 수정</title>

</head>

<body>


<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>


<div class="container">
    <div class="box-header">
        <h4>게시판 수정</h4>
        <hr>
    </div>

    <form name="modify-form" method="post" enctype="multipart/form-data" action="/notice/update.do">
        <table class="formTable">
            <tr>
                <td class="label">글 번호</td>
                <td class="form-control" style="display: table-cell;">${noticeDto.noticeId}</td>
                <input type="hidden" name="NoticeId" id="NoticeId" value="${noticeDto.noticeId}"/>
            </tr>
            <tr>
                <td class="label"> 작성일자</td>
                <td class="form-control" style="display: table-cell;"> ${noticeDto.n_Date}</td>
            </tr>
            <tr>
                <td class="label">조회수</td>
                <td class="form-control" style="display: table-cell;">${noticeDto.n_Count}</td>
            </tr>
            <tr>
                <td class="label">작성자</td>
                <td class="form-control" style="display: table-cell;">${noticeDto.n_Writer}</td>
            </tr>
            <tr>
                <td class="label">제목</td>
                <td><input class="form-control" name="N_Title" id="n_Title" style="width: 100%;"
                                            value="${noticeDto.n_Title}"/></td>
            </tr>
        </table>
        <tr class="textbox">
       <textarea name="N_Context" id="smartEditor" rows="10" cols="100"
                 style="width:100%; height:600px;"> ${noticeDto.n_Context} </textarea>
        </tr>
        <div class="button">
            <input type="submit" id="modifyBtn" value="수정하기"/>
        </div>
    </form>

</div>

<footer>
    <jsp:include page="../footer.jsp"/>
</footer>

</body>
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

            $("#modify-form").submit();

        });
    });

</script>
</html>
