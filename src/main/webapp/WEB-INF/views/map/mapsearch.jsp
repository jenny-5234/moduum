<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <%-- 반응형 웹 --%>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <%-- 카카오맵 API 사용을 위한 키 및 라이브러리 --%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f389b62ab24856e4ae992dfc8a85562&libraries=services,clusterer"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <%-- json 파일을 자바스크립트에서 불러오기 위한 jquery 사용 --%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<%--    <link rel="stylesheet" href="../../../css/navbar.css">--%>
    <link rel="stylesheet" type="text/css" href="../../../css/kakao/kakao_api_polygon.css">
    <link rel="stylesheet" type="text/css" href="../../../css/kakao/kakao_api_search.css">
<%--    <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.css">--%>
</head>
<body>
<%--<div class="nav_container">
    <div class="menubar">
        <%@include file="../navbar.jsp" %>
    </div>
</div>--%>
<%-- 카카오맵 API를 이용해 지도 부분을 만들기 --%>
<div class="map_wrap">
    <%-- 지도의 크기 지정 height:500px --%>
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
        <%--     TODO: 메뉴 접기 버튼 만들기   --%>
        <input type="button" id="shadowclose" class="toggle" value="<"/>
    <%-- 검색 창 관련 --%>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <div>
                    <%-- 선택한 지역을 regionSelection()에 전달 --%>
                    <form onsubmit="regionSelection(); return false;">
                        <select id="area" class="custom-select">
                            <option value="none" selected>지역선택</option>
                            <option value="서울">서울</option>
                            <option value="경기도">경기도</option>
                            <option value="인천">인천</option>
                            <option value="대전">대전</option>
                            <option value="대구">대구</option>
                            <option value="세종특별자치시">세종특별자치시</option>
                            <option value="강원도">강원도</option>
                            <option value="충청북도">충청북도</option>
                            <option value="충청남도">충청남도</option>
                            <option value="경상북도">경상북도</option>
                            <option value="경상남도">경상남도</option>
                            <option value="부산광역시">부산광역시</option>
                            <option value="울산광역시">울산광역시</option>
                            <option value="전라북도">전라북도</option>
                            <option value="광주광역시">광주광역시</option>
                            <option value="전라남도">전라남도</option>
                            <option value="제주도">제주도</option>
                        </select>
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="clustercleared" name="clustercleared">
                            <label class="custom-control-label" for="clustercleared" data-toggle="tooltip" data-placement="bottom" title="경기도만 가능합니다">클러스터</label>
                            <img src="../../../css/kakao/KakaoTalk_20200720_170423777.png" style="width: 15px; height: 15px";  data-toggle="tooltip" data-placement="bottom" title="경기도만 가능합니다">
                            <%--                            <a href="#" data-toggle="tooltip" data-placement="bottom" title="경기도만 가능합니다">?</a>--%>
                        </div>
<%--                        <button type="submit" class="">선택</button>--%>
<%--                        <input type="button" onclick="clus();" value="테스트"/>--%>
                        <%--<div class="custom-control custom-switch">
                        <label for="clustercleared" class="custom-control-label"><input type="checkbox" id="clustercleared"
                                                                                  class="custom-control-input" />클러스터</label>
                        </div>--%>
                    </form>
                </div>
                <br>
                <%-- 검색 keyword를 searchPlaces()에 전달 --%>
                <form onsubmit="searchPlaces(); return false;" class="keysearch">
                    키워드 : <input type="text" placeholder="지역화폐" value="" id="keyword" size="15">
                    <button type="submit">검색</button>
                </form>
            </div>
        </div>
        <hr>
        <%-- 검색된 결과 item 출력부분 --%>
        <ul id="placesList"></ul>
        <%-- 페이지 표시 부분 --%>
        <div id="pagination"></div>
    </div>
</div>
<script src="../../../js/kakao/kakao_api_polygon.js" type="text/javascript"></script>
<script src="../../../js/kakao/kakao_api_search.js" type="text/javascript"></script>
<script src="../../../js/kakao/kakao_api_loaddata.js" type="text/javascript"></script>
<script src="../../../js/kakao/kakao_api_pagechange.js" type="text/javascript"></script>
<script src="../../../js/kakao/kakao_tempjs.js" type="text/javascript"></script>
</body>
</html>
