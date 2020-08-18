<!doctype html>
<html lang="ko">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title> 네비게이션 | 모둠전 </title>
    <link rel="stylesheet" href="/css/navbar.css">
</head>

<body>
<div class="navbar_Menu">
    <ul class="navbar_menu01">
        <li class="navbar_top-menu1" style="width: 3%">
            <ul class="navbar_dept01" style="width: 3%;">
                <li class="navbar_dept01" style="width: 3%;">
            </ul>
        </li>
    </ul>

    <ul class="navbar_menu01">
        <li class="navbar_top-menu1" style="width: 19%; "><span><a href="../"><img
                src="/image/homeImages/modum-logo.png" style="width: 100%;"></a></span>
            <ul class="navbar_dept01" style="width: 19%;">
                <li class="navbar_dept01_li"><a class="navbar_sub-menu"> </a></li>
            </ul>
        </li>

        <li class="navbar_top-menu" style="width: 15%;"><span><a class="navbar_main-menu"
                                                                 href="/intro">지역화폐란?</a></span>
            <ul class="navbar_dept01" style="width: 15%;">
                <li class="navbar_dept01_li" onclick="location.href='/intro#scroll1'"><a
                        class="navbar_sub-menu">지역화폐
                    소개</a></li>
                <li class="navbar_dept01_li" onclick="location.href='/intro#scroll2'"><a
                        class="navbar_sub-menu">지역화폐
                    혜택</a></li>
                <li class="navbar_dept01_li" onclick="location.href='/intro#scroll3'"><a
                        class="navbar_sub-menu">발급
                    방법</a></li>
            </ul>
        </li>
        <li class="navbar_top-menu" style="width: 15%;"><span><a class="navbar_main-menu"
                                                                 href="/chart/chartlist">현황</a></span>
            <ul class="navbar_dept01" style="width: 15%;">
                <li class="navbar_dept01_li" onclick="location.href='/chart/chartlist#chart1'"><a
                        class="navbar_sub-menu">분석 및 예측</a></li>
                <li class="navbar_dept01_li" onclick="location.href='/chart/chartlist#chart2'"><a
                        class="navbar_sub-menu">현황</a></li>

            </ul>
        </li>
        <li class="navbar_top-menu" style="width: 15%;" onclick="location.href='/map/mapsearch'"><span><a
                class="navbar_main-menu">가맹점 찾기</a></span>
            <ul class="navbar_dept01" style="width: 15%;">
                <li class="navbar_dept01_li"><a href="/map/mapsearch"> <img src="/image/homeImages/map01.png"
                                                                            class="navbar_mapImage"/></a></li>
            </ul>
        </li>
        <li class="navbar_top-menu" style="width: 15%;" onclick="location.href='/news/newslist'"><span><a
                class="navbar_main-menu">뉴스 및 이슈</a></span>
            <ul class="navbar_dept01" style="width: 15%;">
                <li class="navbar_dept01_li" onclick="location.href='/news/newslist'"><a
                        class="navbar_sub-menu">뉴스</a>
                </li>

            </ul>
        </li>
        <li class="navbar_top-menu" style="width: 15%;"><span><a class="navbar_main-menu"
                                                                 href="/notice/noticeList">고객지원</a></span>
            <ul class="navbar_dept01" style="width: 15%;">
                <li class="navbar_dept01_li" onclick="location.href='/notice/noticeList'"><a
                        class="navbar_sub-menu">공지사항</a>
                </li>
                <li class="navbar_dept01_li" onclick="location.href='/board/boardlist'"><a
                        class="navbar_sub-menu">정보마당</a></li>
                <li class="navbar_dept01_li" onclick="location.href='/mail/feedback'"><a
                        class="navbar_sub-menu">문의사항</a></li>
            </ul>
        </li>
    </ul>

    <ul class="navbar_menu01">
        <li class="navbar_top-menu1" style="width: 3%">
            <ul class="navbar_dept01" style="width: 3%;">
                <li class="navbar_dept01" style="width: 3%;">
            </ul>
        </li>
    </ul>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/navbar.js"></script>

</body>
</html>