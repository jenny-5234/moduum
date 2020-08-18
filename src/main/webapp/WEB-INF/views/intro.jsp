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
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f389b62ab24856e4ae992dfc8a85562&libraries=services,clusterer"></script>
    <script src="/js/scrollTop.js"></script>
    <script>
        function fnMove(seq) {
            var offset = $("#div" + seq).offset();
            $('html, body').animate({scrollTop: offset.top}, 400);
        }
    </script>
    <link rel="stylesheet" type="text/css" href="/css/intro.css">
    <link rel="stylesheet" type="text/css" href="/css/sidenavbar.css">
    <title>지역 화폐 안내 | 모둠전</title>


</head>
<body>

<div class="nav_container">
    <div class="menubar">
        <jsp:include page="navbar.jsp" />
    </div>
    <div class="sidenavbar">
        <jsp:include page="sidebar.jsp" />
    </div>
</div>

<section class="description_intro">
    <div class="eun">
        <div class="GFD">
            <nav class="side_nav" img src="/image/introImages/side_navbar.png">
                <h2 class="side_nav_img">
                    <p>지역화폐 소개</p>
                </h2>
                <ul class="nav_ul">
                    <li class="nav_li" onclick="fnMove('1')">
                        지역화폐 소개
                    </li>
                    <li class="nav_li" onclick="fnMove('2')">
                        지역화폐 혜택
                    </li>
                    <li class="nav_li" onclick="fnMove('3')">
                        발급 방법
                    </li>
                </ul>
            </nav>
            <div class="intorduce">
                <div class="img">
                    <img src="/image/introImages/intro-mainImg.png" class="main-img"/>
                </div>
                <hr class="hr">
                <div>
                    <section id="scroll1">
                        <h5 class="Dda1" id="div1">
                            <span>지역화폐란 무엇인가요?</span>
                        </h5>
                        <p class="left">
                        <td>${intro.get("intro1")}</td>
                        <div class="intro1_img">
                            <img src="/image/introImages/zeropay.png" class="intro1Image"/>
                        </div>
                        </p>
                    </section>
                </div>
                <hr class="hr">
                <div>
                    <h5 class="Dda1">
                        <span>지역화폐는 왜 필요할까요?</span>
                    </h5>
                    <p class="left">
                    <td>${intro.get("intro2")}</td>
                    </p>
                </div>
                <hr class="hr">
                <div>
                    <section id="scroll2">
                        <h5 class="Dda1" id="div2">
                            <span>무슨 혜택이 있나요?</span>
                        </h5>
                        <ul class="ul_left">
                            <li>${intro.get("intro3")}</li>
                            <li>${intro.get("intro3_1")}</li>

                        </ul>
                    </section>
                </div>
                <hr class="hr">
                <div>
                    <h5 class="Dda1">
                        <span>어디서 구매할 수 있나요?</span>
                    </h5>
                    <p class="left">
                        <%--                    <td>${intro.get("intro4")}</td>--%>
                    <div class="purchase">
                        <div class="purchase-list">
                            <div class="image_div">
                                <img src="/image/introImages/creditcard.png" class="pcl_image"/>
                            </div>
                            <h3 class="pcl-name">카드</h3>
                            <span> 모바일 앱 다운로드를 통한 온라인 구매 <br/> 각 지자체 판매대행점에서 오프라인 구매 </span>
                        </div>
                        <div class="purchase-list">
                            <div class="image_div">
                                <img src="/image/introImages/money.png" class="pcl_image"/>
                            </div>
                            <h3 class="pcl-name">상품권</h3>
                            <span> 각 지자체 판매대행점에서 <br/> 오프라인 구매</span>
                        </div>
                        <div class="purchase-list">
                            <div class="image_div">
                                <img src="/image/introImages/phone.png" class="pcl_image"/>
                            </div>
                            <h3 class="pcl-name">모바일</h3>
                            <span> 모바일 앱을 통한 온라인 구매 </span>

                        </div>
                    </div>
                    </p>
                </div>

                <hr class="hr">
                <div>
                    <section id="scroll3">
                        <h5 class="Dda1" id="div3">
                            <span>지역화폐 발급</span>
                        </h5>
                        <p class="left">
                        <div class="pay-list">
                            <div class="pay-list-auto">
                                <div class="pay1">
                                    <img src="/image/introImages/zero1-1.png" class="pay1-image"/>
                                    <button type="button" class="url-button" style="vertical-align:middle"
                                            onclick="location.href='https://www.zeropaysupporters.or.kr/'">
                                        <span>제로페이<br/>바로가기 </span>
                                    </button>
                                </div>
                                <div class="pay1">
                                    <img src="/image/introImages/gyunggi1-1.png" class="pay1-image"/>
                                    <button type="button" class="url-button" style="vertical-align:middle"
                                            onclick="location.href='http://gmoney.or.kr/main/mainPage2.do'">
                                        <span>경기지역화폐<br/>바로가기 </span>
                                    </button>
                                </div>
                                <div class="pay1">
                                    <img src="/image/introImages/e-um1-1.png" class="pay1-image"/>
                                    <button type="button" class="url-button" style="vertical-align:middle"
                                            onclick="location.href='https://incheoneum.or.kr/sub/sub01.html#4'">
                                        <span>인천e음<br/>바로가기 </span>
                                    </button>
                                </div>
                                <div class="pay1">
                                    <img src="/image/introImages/dongback1-1.png" class="pay1-image"/>
                                    <button type="button" class="url-button" style="vertical-align:middle"
                                            onclick="location.href='https://busandong100.or.kr:447/w/main.asp#none'">
                                        <span>부산동백전<br/>바로가기 </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        </p>
                    </section>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="button_div">
    <button type="button" id="up_button">
        <img src="/image/introImages/up-arrow.png" class="upbutton_img"/>
    </button>
</div>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
<%--<script type="text/javascript">--%>
<%--    $(function () {--%>
<%--        $('.nav_li').click(function () {--%>
<%--            $('.nav_li').removeClass();--%>
<%--            $(this).addClass('on');--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>
</html>

