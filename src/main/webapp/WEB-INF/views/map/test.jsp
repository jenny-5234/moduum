<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <%-- json 파일을 자바스크립트에서 불러오기 위한 jquery 사용 --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/kakao_api_polygon.css">
    <link rel="stylesheet" type="text/css" href="css/kakao_api_search.css">
</head>

<body>
<%
    String data = request.getParameter("kimp");
%>
<%-- 카카오맵 API를 이용해 지도 부분을 만들기 --%>
<div class="map_wrap">
    <%-- 지도의 크기 지정 height:500px --%>
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <%-- 검색 창 관련 --%>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <div>
                    <%-- 선택한 지역을 regionSelection()에 전달 --%>
                    <form onsubmit="regionSelection(); return false;">
                        <select id="area">
                            <option value="none">===선택===</option>
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
                            <option value="울릉군">울릉군</option>
                        </select>
                        <button type="submit">선택</button>
                        <input type="button" onclick="clus();" value="테스트"/>
                        <input type="button" onclick="ch();" value="체크"/>
                        <label for="clustercleared" class="clustercleared"><input type="checkbox" id="clustercleared"
                                                                                  class="clustercleared" disabled/>클러스터</label>
                    </form>
                </div>
                <%-- 검색 keyword를 searchPlaces()에 전달 --%>
                <form onsubmit="searchPlaces(); return false;">
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
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.49461890613009, 127.02760319558533), // 지도의 중심좌표 37.49461890613009, 127.02760319558533
            level: 5 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption),
        // 커스텀 오버레이 객체 생성
        customOverlay = new kakao.maps.CustomOverlay({}),
        // 닫을 수 있는 인포윈도우 객체 생성
        infowindow = new kakao.maps.InfoWindow({zIndex: 1});

    // 마커 클러스터러를 생성합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 3 // 클러스터 할 최소 지도 레벨
    });

    // 지도 위에 확대, 축소 할 수 있는 컨트롤 올리기
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    $.get("city_mark_info/kimpo.json", function (data) {
        // 전에 있던 Element와 페이지를 지운다
        var listEl = document.getElementById('placesList');

        // 가져온 json 파일을 이용해 마커 생성
        var markers = data.map(function (each) {
            var marker = new kakao.maps.Marker({
                // data 의 길이만큼 반복하면서 위도와 경도를 저장
                position: new kakao.maps.LatLng(each.y, each.x)
            });
            // 클러스터 마커 클릭 이벤트
            (function (marker, place_name, road_address_name, address_name, phone, place_url, id, x, y) {
                kakao.maps.event.addListener(marker, 'click', function () {
                    displayInfowindow(marker, place_name, road_address_name, address_name, phone, place_url, id, x, y);
                });
            })(marker, each.place_name, each.road_address_name, each.address_name, each.phone, each.place_url, each.id, each.x, each.y);
            return marker;
        });
        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
        console.log(markers);

        // console.log(stringified);
        // var test = JSON.stringify(markers, tui(markers));
        // console.log(JSON.parse(test));
        /*const replacer = (key, value) =>
            typeof value === 'function' ? value.toString() : value;*/
        // const stringified = JSON.stringify(markers, stringifyWithFunctions);
        // console.log(JSON.parse(serialized));
        // download("test", tyu);

        /* 클러스터 미리 저장
        switch (path) {
            case("city_mark_info/kimpo.json"): clusterer.addMarkers(kimp); console.log("김포"); break;
            case("city_mark_info/gapyeong.json"): clusterer.addMarkers(gapyeong); console.log("가평"); break;
            case("city_mark_info/ansan.json"): clusterer.addMarkers(ansan); break;
            case("city_mark_info/anseong.json"): clusterer.addMarkers(anseong); break;
            case("city_mark_info/anyang.json"): clusterer.addMarkers(anyang); break;
            case("city_mark_info/bucheon.json"): clusterer.addMarkers(bucheon); break;
            case("city_mark_info/dongducheon.json"): clusterer.addMarkers(dongducheon); break;
            case("city_mark_info/goyang.json"): clusterer.addMarkers(goyang); break;
            case("city_mark_info/gunpo.json"): clusterer.addMarkers(gunpo); break;
            case("city_mark_info/guri.json"): clusterer.addMarkers(guri); break;
            case("city_mark_info/gwacheon.json"): clusterer.addMarkers(gwacheon); break;
            case("city_mark_info/gwangju.json"): clusterer.addMarkers(gwangju); break;
            case("city_mark_info/gwangmyeong.json"): clusterer.addMarkers(gwangmyeong); break;
            case("city_mark_info/hanam.json"): clusterer.addMarkers(hanam); break;
            case("city_mark_info/hwaseong.json"): clusterer.addMarkers(hwaseong); break;
            case("city_mark_info/icheon.json"): clusterer.addMarkers(icheon); break;
            case("city_mark_info/namyangju.json"): clusterer.addMarkers(namyangju); break;
            case("city_mark_info/osan.json"): clusterer.addMarkers(osan); break;
            case("city_mark_info/paju.json"): clusterer.addMarkers(paju); break;
            case("city_mark_info/pocheon.json"): clusterer.addMarkers(pocheon); break;
            case("city_mark_info/pyeongtaek.json"): clusterer.addMarkers(pyeongtaek); break;
            case("city_mark_info/seongnam.json"): clusterer.addMarkers(seongnam); break;
            case("city_mark_info/siheung.json"): clusterer.addMarkers(siheung); break;
            case("city_mark_info/suwon.json"): clusterer.addMarkers(suwon); break;
            case("city_mark_info/uijeongbu.json"): clusterer.addMarkers(uijeongbu); break;
            case("city_mark_info/uiwang.json"): clusterer.addMarkers(uiwang); break;
            case("city_mark_info/yangju.json"): clusterer.addMarkers(yangju); break;
            case("city_mark_info/yangpyeong.json"): clusterer.addMarkers(yangpyeong); break;
            case("city_mark_info/yeoju.json"): clusterer.addMarkers(yeoju); break;
            case("city_mark_info/yeoncheon.json"): clusterer.addMarkers(yeoncheon); break;
            case("city_mark_info/yongin.json"): clusterer.addMarkers(yongin); break;
        }*/
        // 로딩 화면 종료
        console.log("로딩 완료");
    });

    function saveData() {
        $.ajax({
            type: 'POST',
            url: '',
            data: markers,
            dataType: 'json',
            success: function (data) {
                alert("성공");
            },
            error: function (data) {
                alert("실패");
            }
        });
    }
</script>
</body>
</html>
