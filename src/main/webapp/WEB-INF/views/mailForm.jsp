<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>문의사항 | 모둠전</title>
    <%-- 반응형 웹 --%>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/mail.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/sidenavbar.css">


</head>
<body>
<div class="nav_container">
    <div class="menubar">
        <%@include file="navbar.jsp" %>
    </div>
</div>

<section class="description_intro">
    <div class="YL">
        <div class="description_intro_auto">
            <%--    <div class="container">--%>
            <nav class="side_nav" img src="/image/introImages/side_navbar.png">
                <h2 class="side_nav_img">
                    <p>고객지원</p>
                </h2>
                <ul class="nav_ul">
                    <li class="nav_li" onclick="location.href='/notice/noticeList'">
                        공지사항
                    </li>
                    <li class="nav_li" onclick="location.href='/board/boardlist'">
                        정보마당
                    </li>
                    <li class="nav_li" onclick="location.href='/mail/feedback'">
                        문의사항
                    </li>
                </ul>
            </nav>

            <div class="mail_box">
                <h4 class="Dda1">문의사항</h4>
                <hr style="margin: 10px 0px 10px 0px;">
                <form action="/mail/mailSender" method="post">
                    <div align="center"><!-- 제목 -->
                        <input type="text" name="title" size="120" style="width :98%" placeholder="제목을 입력해주세요"
                               class="form-control">
                    </div>
                    <p>
                    <div align="center"><!-- 내용 -->
                        <textarea name="content" cols="120" rows="12" style="width:98%; resize:none"
                                  class="form-control">이름 : &#10;이메일 :  &#10;내용 : </textarea>
                    </div>
                    <p>
                    <div align="center">
                        <input type="submit" value="메일 보내기" class="btn btn-warning">
                    </div>
                </form>
            </div>
        </div>
    </div>

</section>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
