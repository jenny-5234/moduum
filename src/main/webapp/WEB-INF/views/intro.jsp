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
<meta name="viewport"
      content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f389b62ab24856e4ae992dfc8a85562&libraries=services,clusterer"></script>

<head>
<%--    <script type="text/javascript" src="/js/scrollTop.js" />--%>
    <link rel="stylesheet" href="/css/intro.css">
    <title>Title</title>


</head>
<body>

    <div class="container">
        <div class="menubar">
            <%@include file="navbar.jsp" %>
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
                    <li class="nav_li">
                        지역화폐 소개
                    </li>
                    <li class="nav_li">
                        지역화폐 장점
                    </li>
                    <li class="nav_li">
                        발급 방법
                    </li>
                </ul>
            </nav>
            <div class="intorduce">
                <div class="img">
                    <img src="/image/introImages/money1-1.png" class="img1"/>
                </div>
                <hr class="hr">
                <div>
                    <h5 class="Dda1">
                        <span>경기지역화폐란 무엇인가요?</span>
                    </h5>
                    <p class="left">
                    <td>${intro.get("intro1")}</td>
                    <div class="intro1_img">
                        <img src="/image/introImages/zeropay.png"/>
                    </div>
                    </p>
                </div>
                <hr class="hr">
                <div>
                    <h5 class="Dda1">
                        <span>경기지역화폐는 왜 필요할까요?</span>
                    </h5>
                    <p class="left">
                    <td>${intro.get("intro2")}</td>
                    </p>
                </div>
                <hr class="hr">
                <div>
                    <h5 class="Dda1">
                        <span>무슨 혜택이 있나요?</span>
                    </h5>
                    <p class="left">
                    <td>${intro.get("intro3")}</td>
                    </p>
                </div>
                <hr class="hr">
                <div>
                    <h5 class="Dda1">
                        <span>어디서 구매할 수 있나요?</span>
                    </h5>
                    <p class="left">
                    <td>${intro.get("intro4")}</td>
                    </p>
                </div>
                <hr class="hr">
                <div>
                    <h5 class="Dda1">
                        <span>영상으로 보는 경기지역화폐</span>
                    </h5>
                    <p class="left">
                    <div class="box_top_name">
                        <span>팝업존</span>
                        <hr>
                    </div>
                    <div class="box_insert">
                        <jsp:include page="popup.jsp"/>
                    </div>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="button_div">
    <button type="button" id="up_button" onclick="goTop()">
        <img src="/image/introImages/up-arrow.png" class="button_img"/>
    </button>
</div>


<%--<div class="section over-hide">--%>
<%--    <div class="container">--%>
<%--        <div class="row full-height justify-content-center">--%>
<%--            <div class="col-12 text-center align-self-center py-5">--%>
<%--                <div class="section text-center py-5 py-md-0">--%>
<%--                    <input class="pricing" type="checkbox" id="pricing" name="pricing"/>--%>
<%--                    <label for="pricing"><span class="block-diff">일반 발행<span--%>
<%--                            class="float-right">정책 발행</span></span></label>--%>
<%--                    <div class="card-3d-wrap mx-auto">--%>
<%--                        <div class="card-3d-wrapper">--%>
<%--                            <div class="card-front">--%>
<%--                                <h5 class="Dda1">--%>
<%--                                    <span>무슨 혜택이 있나요?</span>--%>
<%--                                </h5>--%>
<%--                                <p class="left">--%>
<%--                                <td>${intro.get("intro3")}</td>--%>
<%--                                </p>--%>

<%--                            </div>--%>
<%--                            <div class="card-back">--%>
<%--                                <h5 class="Dda1">--%>
<%--                                    <span>혜택은 없나영?</span>--%>
<%--                                </h5>--%>
<%--                                <p class="left">--%>
<%--                                <td>${intro.get("intro2")}</td>--%>
<%--                                </p>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<footer>
    <div class="foo_div1">
        <span>모둠전</span> <span>|</span>
        <span>대표 : 영웅다영</span> <span>|</span>
        <p>주소 : 비트교육센터</p>
    </div>
</footer>

</body>
</html>
