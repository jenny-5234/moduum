<%--
  Created by IntelliJ IDEA.
  User: YOUNGLOT
  Date: 2020-07-16
  Time: 오후 7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/sidebar.css">
<head>

    <title>Title</title>

</head>
<body>

<div id="mySidenav" class="sidenav">
    <div class="sidenav_logo_image">
        <img src="/image/homeImages/modum-logo.png" style="width: 80%;"/>
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav(); closeMask();">&times;</a>
    </div>

    <div class="accordion-box">
        <ul class="list">
            <li>
                <div class="sub_nav">지역화폐란?   </div>
                <div class="sub_menu">
                    <div class="menu1" onclick="location.href='/intro#scroll1'">지역화폐 소개</div>
                    <div class="menu1" onclick="location.href='/intro#scroll2'">지역화폐 장점</div>
                    <div class="menu1" onclick="location.href='/intro#scroll3'">지역화폐 발급</div>
                </div>
            </li>
            <li>
                <div class="sub_nav">현황</div>
                <div class="sub_menu">
                    <div class="menu1" onclick="location.href='/chart/chartlist#chart1'">분석 및 예측</div>
                    <div class="menu1" onclick="location.href='/chart/chartlist#chart2'">현황</div>
                </div>
            </li>
            <li>
                <div class="sub_nav" onclick="location.href='/map/mapsearch'">가맹점 찾기</div>
            </li>
            <li>
                <div class="sub_nav" onclick="location.href='/news/newslist'">뉴스</div>

            </li>
            <li>
                <div class="sub_nav">공지사항</div>
                <div class="sub_menu">
                    <div class="menu1" onclick="location.href='/notice/noticeList'">공지사항</div>
                    <div class="menu1" onclick="location.href='/board/boardlist'">정보마당</div>
                    <div class="menu1" onclick="location.href='/mail/feedback'">고객문의</div>
                </div>
            </li>

        </ul>
    </div>
</div>
<span class="open_Btn" onclick="openNav(); mask();">&#9776;</span>
<div class="open_menu">
    <img src="/image/homeImages/modum-logo1.png" class="open_menu_logo">
</div>

</body>

<script src="/js/sidebar.js"></script>
</html>
