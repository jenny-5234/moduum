var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(35.84422370300031, 127.66131429456038), // 지도의 중심좌표 37.49461890613009, 127.02760319558533
        level: 13, // 지도의 확대 레벨
        disableDoubleClick: true,
        draggable: false,
        scrollwheel: false
    };

var map = new kakao.maps.Map(mapContainer, mapOption),
    // 커스텀 오버레이 객체 생성
    customOverlay = new kakao.maps.CustomOverlay({}),
    // 닫을 수 있는 인포윈도우 객체 생성
    infowindow = new kakao.maps.InfoWindow({zIndex: 1});

var latlng = new kakao.maps.LatLng(35.84422370300031, 127.66131429456038);

$.getJSON('../../../location/allv3.json', function (geojson) {
    var data = geojson.features;
    var coordinates = [];    // 좌표 저장할 배열
    var name = '';            // 행정 구 이름
    // 폴리곤 length 만큼 반복
    $.each(data, function (index, val) {
        coordinates = val.geometry.coordinates;     // coordinates 에 좌표 저장
        name = val.properties.SIG_KOR_NM;
        displayArea2(coordinates, name);       // displayArea 에 좌표, 시 이름, 도시 이름, 다음 시 이름을 전달
    });
});


// 지도에 마커와 인포윈도우를 표시하는 함수입니다
/*function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: locPosition
    });

    var iwContent = message // 인포윈도우에 표시할 내용

    // 인포윈도우를 생성합니다
    // var infowindow2 = new kakao.maps.InfoWindow({
    //     content : iwContent
    // });
    infowindow.setContent(iwContent);

    // 인포윈도우를 마커위에 표시합니다
    infowindow.open(map, marker);

    // 지도 중심좌표를 접속위치로 변경합니다
    // map.setCenter(locPosition);

    $.getJSON('../../../location/allv3.json', function (geojson) {
        var data = geojson.features;
        var coordinates = [];    // 좌표 저장할 배열
        var name = '';            // 행정 구 이름
        // 폴리곤 length 만큼 반복
        $.each(data, function (index, val) {
            coordinates = val.geometry.coordinates;     // coordinates 에 좌표 저장
            name = val.properties.SIG_KOR_NM;
            displayArea2(coordinates, name);       // displayArea 에 좌표, 시 이름, 도시 이름, 다음 시 이름을 전달
        });
    });
}*/
/*var locPosition = '';
var message = '';

function getGeoLocation() {
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:0px 0px 0px 13px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        locPosition = new kakao.maps.LatLng(37.49461890613009, 127.02760319558533),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }
}*/

var polygons = [];
var tempPath = [];          // 임시로 폴리곤을 넣어둘 변수(다중 폴리곤)
var path = [];            // 폴리곤 그려줄 path
var tempPolygon = [];

function displayArea2(coordinates, name) {
    $.each(coordinates[0], function (index, coordinate) {        // console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
        tempPath.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));            // new kakao.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가

    });
    if (name === '광주광역시') {
        tempPolygon = tempPath;
    }
    // path에 광주광역시랑 전라남도가 포함 되어야 함
    else if (name === '전라남도') {
        path.push(tempPolygon);
    }
    path.push(tempPath);
    // 다각형을 생성합니다
    var polygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: path,
        strokeWeight: 2,
        strokeColor: '#004c80',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7
    });
    path = [];
    tempPath = [];

    polygons.push(polygon);     // polygon 정보를 polygons 에 푸쉬한다(나중에 폴리곤을 지우기 위해 푸쉬)
    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다

    kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

        customOverlay.setContent('<div class="area">' + name + '</div>');       // 폴리곤에 마우스 포인터를 올리면 지역명 표시

        customOverlay.setPosition(mouseEvent.latLng);       // 클릭한 위치를 저장
        customOverlay.setMap(map);      // 커스텀 오버레이를 지도에 표시한다
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다
    kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {

        customOverlay.setPosition(mouseEvent.latLng);
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다
    kakao.maps.event.addListener(polygon, 'mouseout', function () {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);     // 커스텀 오버레이를 지도에서 제거합니다
    });

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다
    kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {
        switch (name) {
            case("서울특별시"):
                $(".logo_image").attr('src', '../../../image/logoImage/서울.png');
                $(".info_info1").text('서울특별시');
                $(".info_info2").text('제로페이 스티커가 붙어있는 소상공인 가맹점');
                $(".info_info3").text(' ');
                $(".info_info4").text('1670-0582');
                $(".homepage_button").attr("href", "https://www.zeropay.or.kr/main.do");
                break;

            case("인천광역시"):
                $(".logo_image").attr('src', '../../../image/logoImage/인천.png');
                $(".info_info1").text('인천광역시');
                $(".info_info2").text('인천에 사업자 등록을 한 점포(약 17만 5천개)');
                $(".info_info3").text('백화점, 대형마트, 기업형슈퍼마켓, 일부 프랜차이즈 직영점');
                $(".info_info4").text('1811-8668 | 1899-4118');
                $(".homepage_button").attr("href", "https://incheoneum.or.kr/");
                break;

            case("경기도"):
                $(".logo_image").attr('src', '../../../image/logoImage/경기도.png');
                $(".info_info1").text('경기도 31개 시·군');
                $(".info_info2").text(' 발행지역 해당 시 · 군 지역내에 등록된 가맹점');
                $(".info_info3").text('백화점, 대형마트, 기업형 슈퍼마켓, 유흥주점 제외');
                $(".info_info4").text('코나아이 고객센터(1899-7997)');
                $(".homepage_button").attr("href", "http://www.gmoney.or.kr/");
                break;

            case("세종특별자치시"):
                $(".logo_image").attr('src', '../../../image/logoImage/세종.jpg');
                $(".info_info1").text('세종특별자치시');
                $(".info_info2").text('세종지역 내 IC카드 단말기가 설치된 점포');
                $(".info_info3").text('대형마트, 기업형슈퍼마켓, 유흥·사행업소, 일부 프랜차이즈 직영점');
                $(".info_info4").text('1577-5628');
                $(".homepage_button").attr("href", "https://www.sejong.go.kr/life/sub07_01.do");
                break;

            case("부산광역시"):
                $(".logo_image").attr('src', '../../../image/logoImage/부산.png');
                $(".info_info1").text('부산광역시');
                $(".info_info2").text('사업장이 부산광역시인 신용카드 가맹점');
                $(".info_info3").text('백화점, 대형마트, 기업형슈퍼마켓, 프랜차이즈 직영점');
                $(".info_info4").text('1577-1432');
                $(".homepage_button").attr("href", "https://busandong100.or.kr:447/w/main.asp#none");
                break;

            case("대전광역시"):
                $(".logo_image").attr('src', '../../../image/logoImage/대전.png');
                $(".info_info1").text('대전광역시');
                $(".info_info2").text('대전 내 IC카드 단말기 사용 점포');
                $(".info_info3").text('백화점 대규모 점포, 유흥·사행업소, 온라인 결제 등 일부는 제외');
                $(".info_info4").text('1661-9645');
                $(".homepage_button").attr("href", "https://www.ontongdaejeon.kr/main.do");
                break;

            case("대구광역시"):
                $(".logo_image").attr('src', '../../../image/logoImage/대구.png');
                $(".info_info1").text('대구광역시 | 대구은행');
                $(".info_info2").text('대구 내 카드 단말기 설치된 가맹점 어디든 이용 가능');
                $(".info_info3").text('온라인업종, 백화점, 대형마트, 유흥, 사행성 업종');
                $(".info_info4").text('BDG대구은행 고객센터(1566-5050)');
                $(".homepage_button").attr("href", "http://xn--2e0bu9hsujd1k8xofxc.kr/");
                break;

            case("광주광역시"):
                $(".logo_image").attr('src', '../../../image/logoImage/광주.png');
                $(".info_info1").text('광주광역시 | 광주은행');
                $(".info_info2").text('비씨카드 등록된 광주시 9만여개 가맹업소');
                $(".info_info3").text('백화점, 대형마트, 기업형 SSM, 유흥업소, 온라인 가맹점');
                $(".info_info4").text('광주은행 카드헬프센터 ☎ 1577-3650');
                $(".homepage_button").attr("href", "https://www.gwangju.go.kr/contentsView.do?pageId=www320");
                break;

            case("울산광역시"):
                $(".logo_image").attr('src', '../../../image/logoImage/울산.jpg');
                $(".info_info1").text('울산광역시');
                $(".info_info2").text('울산시 내 모든 가맹점');
                $(".info_info3").text('백화점, 대형마트, 사행성업체, 주유소, 종합병원 ');
                $(".info_info4").text('1899-6946');
                $(".homepage_button").attr("href", "http://www.ulsan.go.kr/economy/intro");
                break;

            case("강원도"):
                $(".logo_image").attr('src', '../../../image/logoImage/강원.jpg');
                $(".info_info1").text('강원도 | 제로페이 ');
                $(".info_info2").text('전통시장, 음식점, 슈퍼마켓, 주유소 등 도내 강원상품권 사용점');
                $(".info_info3").text('');
                $(".info_info4").text('033-249-3389, 3219');
                $(".homepage_button").attr("href", "https://gwgc.gwd.go.kr/");
                break;

            case("충청북도"):
                $(".logo_image").attr('src', '../../../image/logoImage/충북.png');
                $(".info_info1").text('충청북도 도내 시·군');
                $(".info_info2").text('전통시장과 소매점 등 시·군 등록 가맹점');
                $(".info_info3").text('');
                $(".info_info4").text('충청북도 경제기업과 (043-220-3254)');
                $(".homepage_button").attr("href", "http://www1.chungbuk.go.kr/intro/index.html");
                break;

            case("충청남도"):
                $(".logo_image").attr('src', '../../../image/logoImage/충남.jpg');
                $(".info_info1").text('충청남도 도내 시·군');
                $(".info_info2").text('전통시장과 소매점 등 시·군 등록 가맹점');
                $(".info_info3").text('');
                $(".info_info4").text('충청남도 경제실 소상공기업과 (041-635-3444)');
                $(".homepage_button").attr("href", "http://www.chungnam.go.kr/search.do");
                break;

            case("전라북도"):
                $(".logo_image").attr('src', '../../../image/logoImage/전북.jpg');
                $(".info_info1").text('전라북도 도내 시·군');
                $(".info_info2").text('발행 지역 내에 있는 모든 가맹점');
                $(".info_info3").text('온라인쇼핑몰, 백화점, 대형마트(이마트, 홈플러스 등), 유흥업소');
                $(".info_info4").text('');
                $(".homepage_button").attr("href", "http://www.jeonbuk.go.kr/index.jeonbuk");
                break;

            case("전라남도"):
                $(".logo_image").attr('src', '../../../image/logoImage/전남지역화폐.png');
                $(".info_info1").text('전라남도 도내 시·군');
                $(".info_info2").text('전라남도 내 IC카드 결제가 가능한 모든 가맹점');
                $(".info_info3").text('백화점, 대형마트, 유흥업소, 기업형슈퍼마켓 등');
                $(".info_info4").text('');
                $(".homepage_button").attr("href", "https://www.jeonnam.go.kr/contentsView.do?menuId=jeonnam0501090400");
                break;

            case("경상북도"):
                $(".logo_image").attr('src', '../../../image/logoImage/경북.jpg');
                $(".info_info1").text('경상북도 도내 시·군');
                $(".info_info2").text('경상북도 내 IC카드 결제 가맹점(대구에서도 사용가능)');
                $(".info_info3").text('전자매장, 유흥업소,일부 대형마트, 백화점');
                $(".info_info4").text('경상북도 일자리경제실 민생경제과 054-880-2656');
                $(".homepage_button").attr("href", "https://www.gb.go.kr/Main/index.html");
                break;

            case("경상남도"):
                $(".logo_image").attr('src', '../../../image/logoImage/경남.jpg');
                $(".info_info1").text('경상남도 도내 시·군');
                $(".info_info2").text('경상남도 내 IC카드 결제가 가능한 모든 가맹점');
                $(".info_info3").text('백화점, 대형마트, 유흥업소, 기업형슈퍼마켓 등');
                $(".info_info4").text('일자리경제국 소상공인정책과 055-211-3411');
                $(".homepage_button").attr("href", "http://www.gyeongnam.go.kr/index.gyeong?menuCd=DOM_000000110014005001");
                break;
            default:
                break;
        }
        sendValue(name);
    });
}

function sendValue(val) {
    $(".map_button").on('click', function () {
        if (val) {
            $(".map_button").attr('href', '/map/mapsearch?region=' + val);
        }
    });
}

// window.addEventListener("load", getGeoLocation);
// window.addEventListener("resize", getGeoLocation);
window.onresize = function (event) {
    /*if (locPosition) {
        displayMarker(locPosition, message);
    }*/
    map.setCenter(latlng);
}
