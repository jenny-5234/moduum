<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-06-03
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <link rel="stylesheet" href="/css/banner.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<body>
<!-- Swiper를 사용하기 위한 최소 기본 형태 -->
<!-- 클래스명은 변경하면 안 됨 -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="/image/homeImages/incheonimage.png"></div>
            <div class="swiper-slide"><img src="/image/homeImages/gyeonggidoimage.png"></div>
            <div class="swiper-slide"><img src="/image/homeImages/seoulimage.jpg"></div>
        </div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>

<script>
    // 클래스명 swiper-container 입력
    // 이 클래스명은 변경하면 안됨
    var swiper = new Swiper('.swiper-container', {

        // 자동높이 사용여부 : 사용하지 않을시 기본값은 false
        autoHeight : false,

        loop : true, // 슬라이드 반복

        autoplay : {
            delay : 2000,
            disableOnInteraction: false,
        },
        speed : 1000, // 슬라이드 속도 1초
        pagination : { // 페이징
            el : '.swiper-pagination',
            clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
        },
        autoplayDisableOnInteraction: false,
        navigation : { // 네비게이션
            nextEl : '.swiper-button-next', // 다음 버튼 클래스명
            prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
        },
    });
</script>
</body>
</html>
