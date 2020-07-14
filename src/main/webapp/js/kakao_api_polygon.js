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

// 행정구역 구분
// polygonPath : json 경로 city : 선택한 시 이름
function getjson(polygonPath, city) {
    // 선택했을 때 마커, 폴리곤, itemElement, page, 클러스터를 초기화
    initialization();
    // jquery를 이용해서 json 가져오기
    $.getJSON(polygonPath, function (geojson) {
        var data = geojson.features;
        var coordinates = [];    // 좌표 저장할 배열
        var name = '';            // 행정 구 이름
        // 폴리곤 length 만큼 반복
        $.each(data, function (index, val) {
            coordinates = val.geometry.coordinates;     // coordinates 에 좌표 저장
            name = val.properties.SIG_KOR_NM;       // name 에 시 이름 저장
            if (index + 1 < data.length) {  // data.length를 초과하여 가져오지 않는다
                var nextValname = data[index+1].properties.SIG_KOR_NM;  // 다음 index의 시 이름을 변수에 저장
            }
            displayArea(coordinates, name, city, nextValname);       // displayArea 에 좌표, 시 이름, 도시 이름, 다음 시 이름을 전달
        });
    });
}

var polygons = [];            // function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.
var checkedClusterPolygonEvent = false;
var tempPath = [];          // 임시로 폴리곤을 넣어둘 변수(다중 폴리곤)
var path = [];            // 폴리곤 그려줄 path

// 행정구역 폴리곤 지도에 표시
function displayArea(coordinates, name, city, tname) {
    var points = [];        // 중심좌표 구하기 위한 지역구 좌표들

    // 좌표 length 만큼 반복
    /*$.each(coordinates[0], function (index, coordinate) {        // console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
        var point = new Object();       // point 오브젝트 생성
        point.x = coordinate[1];        // 위도 정보
        point.y = coordinate[0];        // 경도 정보
        points.push(point);     // points에 point 를 푸쉬
        path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));            // new kakao.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
    });*/

    $.each(coordinates[0], function (index, coordinate) {        // console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
        /*var point = new Object();       // point 오브젝트 생성
        point.x = coordinate[1];        // 위도 정보
        point.y = coordinate[0];        // 경도 정보
        points.push(point);     // points에 point 를 푸쉬*/
        tempPath.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));            // 다중 폴리곤을 위해 좌표를 임시로 푸쉬한다
    });
    path.push(tempPath);        // path 에 임시로 저장한 좌표를 푸쉬한다

    // 현재 시 이름이 다음 시이름과 다르면
    if (name != tname) {
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
        polygons.push(polygon);     // polygon 정보를 polygons 에 푸쉬한다(나중에 폴리곤을 지우기 위해 푸쉬)
        // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다
        // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다

        kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
            if (checkedClusterPolygonEvent) {
                polygon.setOptions({fillColor: '#fff'});
            } else {
                polygon.setOptions({fillColor: '#09f'});
            }

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
            if (!checkedClusterPolygonEvent) {
                polygon.setOptions({fillColor: '#fff'});
            }
            customOverlay.setMap(null);     // 커스텀 오버레이를 지도에서 제거합니다
        });

        // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다
        kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {
            // 선택했던 폴리곤과 선택한 폴리곤의 이름이 다른 경우
            if (polygonSelectCheck != name) {
                if (city == "경기도") {
                    polygon.setOptions({fillColor: '#fff'});
                }
                switch (name) {
                    case("김포시"):
                        makecluster("../../../city_mark_info/kimpo.json", 37.61527678908309, 126.71565392785833, 5);     // makecluster 에 json 경로와 위도, 경도, 맵 레벨을 전달한다
                        deletepartPolygon(polygons, 16);        // 선택한 폴리곤을 제외하고 전부 지운다
                        break;
                    case("가평군"):
                        makecluster("../../../../../../city_mark_info/gapyeong.json", 37.83144628724424, 127.50956510475636, 5);
                        deletepartPolygon(polygons, 21);
                        break;
                    case("안산시"):
                        makecluster("../../../city_mark_info/ansan.json", 37.32191305982758, 126.8308372448452, 4);
                        deletepartPolygon(polygons, 26);
                        break;
                    case("안성시"):
                        makecluster("../../../city_mark_info/anseong.json", 37.0080057984534, 127.2797170597116, 5);
                        deletepartPolygon(polygons, 15);
                        break;
                    case("안양시"):
                        makecluster("../../../city_mark_info/anyang.json", 37.3942615042009, 126.95685487680574, 3);
                        deletepartPolygon(polygons, 27);
                        break;
                    case("부천시"):
                        makecluster("../../../city_mark_info/bucheon.json", 37.50351763465878, 126.76603786718101, 3);
                        deletepartPolygon(polygons, 1);
                        break;
                    case("동두천시"):
                        makecluster("../../../city_mark_info/dongducheon.json", 37.903606760983585, 127.06043391358757, 5);
                        deletepartPolygon(polygons, 4);
                        break;
                    case("고양시"):
                        makecluster("../../../city_mark_info/goyang.json", 37.65842259635158, 126.83195226626859, 5);
                        deletepartPolygon(polygons, 23);
                        break;
                    case("군포시"):
                        makecluster("../../../city_mark_info/gunpo.json", 37.36163453050286, 126.93520310836283, 5);
                        deletepartPolygon(polygons, 10);
                        break;
                    case("구리시"):
                        makecluster("../../../city_mark_info/guri.json", 37.59436814152007, 127.12964243445381, 5);
                        deletepartPolygon(polygons, 6);
                        break;
                    case("과천시"):
                        makecluster("../../../city_mark_info/gwacheon.json", 37.429239559910044, 126.98770743965969, 5);
                        deletepartPolygon(polygons, 5);
                        break;
                    case("광주시"):
                        makecluster("../../../city_mark_info/gwangju.json", 37.42940410458226, 127.25513875335848, 5);
                        deletepartPolygon(polygons, 17);
                        break;
                    case("광명시"):
                        makecluster("../../../city_mark_info/gwangmyeong.json", 37.4785787471002, 126.8646534476972, 5);
                        deletepartPolygon(polygons, 2);
                        break;
                    case("하남시"):
                        makecluster("../../../city_mark_info/hanam.json", 37.53928087643411, 127.21485835369926, 5);
                        deletepartPolygon(polygons, 12);
                        break;
                    case("화성시"):
                        makecluster("../../../city_mark_info/hwaseong.json", 37.19954350601318, 126.83147395712996, 5);
                        deletepartPolygon(polygons, 30);
                        break;
                    case("이천시"):
                        makecluster("../../../city_mark_info/icheon.json", 37.27227209940599, 127.43508818121765, 5);
                        deletepartPolygon(polygons, 14);
                        break;
                    case("남양주시"):
                        makecluster("../../../city_mark_info/namyangju.json", 37.63603760318754, 127.21647637193799, 5);
                        deletepartPolygon(polygons, 7);
                        break;
                    case("오산시"):
                        makecluster("../../../city_mark_info/osan.json", 37.14989073484177, 127.07751868124821, 5);
                        deletepartPolygon(polygons, 8);
                        break;
                    case("파주시"):
                        makecluster("../../../city_mark_info/paju.json", 37.76004992869594, 126.77986886139607, 5);
                        deletepartPolygon(polygons, 13);
                        break;
                    case("포천시"):
                        makecluster("../../../city_mark_info/pocheon.json", 37.894998700762386, 127.20032665354528, 5);
                        deletepartPolygon(polygons, 19);
                        break;
                    case("평택시"):
                        makecluster("../../../city_mark_info/pyeongtaek.json", 36.992262930984346, 127.11268445820784, 5);
                        deletepartPolygon(polygons, 3);
                        break;
                    case("성남시"):
                        makecluster("../../../city_mark_info/seongnam.json", 37.41993031887288, 127.1265112485552, 5);
                        deletepartPolygon(polygons, 24);
                        break;
                    case("시흥시"):
                        makecluster("../../../city_mark_info/siheung.json", 37.38012362846484, 126.8029760804121, 5);
                        deletepartPolygon(polygons, 9);
                        break;
                    case("수원시"):
                        makecluster("../../../city_mark_info/suwon.json", 37.2635914378312, 127.02871082779522, 3);
                        deletepartPolygon(polygons, 25);
                        break;
                    case("의정부시"):
                        makecluster("../../../city_mark_info/uijeongbu.json", 37.73806430212202, 127.03389625756047, 5);
                        deletepartPolygon(polygons, 0);
                        break;
                    case("의왕시"):
                        makecluster("../../../city_mark_info/uiwang.json", 37.344765000866936, 126.96827042256258, 5);
                        deletepartPolygon(polygons, 11);
                        break;
                    case("양주시"):
                        makecluster("../../../city_mark_info/yangju.json", 37.78532045762223, 127.04577814226495, 5);
                        deletepartPolygon(polygons, 18);
                        break;
                    case("양평군"):
                        makecluster("../../../city_mark_info/yangpyeong.json", 37.491795966977726, 127.48757343156568, 5);
                        deletepartPolygon(polygons, 22);
                        break;
                    case("여주시"):
                        makecluster("../../../city_mark_info/yeoju.json", 37.298431053050095, 127.63705490477399, 5);
                        deletepartPolygon(polygons, 20);
                        break;
                    case("연천군"):
                        makecluster("../../../city_mark_info/yeoncheon.json", 38.09652315873178, 127.07534723541715, 5);
                        deletepartPolygon(polygons, 28);
                        break;
                    case("용인시"):
                        makecluster("../../../city_mark_info/yongin.json", 37.24103944439466, 127.17747953553028, 5);
                        deletepartPolygon(polygons, 29);
                        break;
                    // 경기도가 아닌 지역을 선택했을 경우 카카오 API에 검색을 한다
                    default:
                        ps.keywordSearch(city + name + " 긴급재난지원금", placesSearchCB);
                }
                // 선택한 폴리곤의 이름을 저장한다
                polygonSelectCheck = name;
            }
            // 선택했던 폴리곤과 선택한 폴리곤의 이름이 같은 경우
            else {
                console.log("미실행");
            }
            // 폴리곤을 선택했을 때 열려있던 커스텀 오버레이를 닫는다
            closeOverlay();
        });
        path = [];  // 다음 값을 위해 초기화
    }
    tempPath = [];  // 다음 값을 위해 초기화
}

// 클러스터 생성
function makecluster(path, x, y, maplevel) {
    if (clustercheck) {
        // 클러스터로 보여줄 때 mouseover, mouseout 이벤트에서 색상 변경 안함
        checkedClusterPolygonEvent = true;

        // 좌표로 이동하고 애니메이션 효과 적용
        map.setLevel(maplevel, {
            animate: {
                duration: 500
            },
            anchor: new kakao.maps.LatLng(x, y)
        });
        // 이동하면서 불러오면 렉이 발생하므로 지도를 이동한뒤 1초후에 클러스터를 생성
        // LoadingWithMask();   // 클러스터 미리 생성할 시 활성화
        setTimeout(function () {
            // 로딩 화면 보여줌
            LoadingWithMask();
            // 클러스터를 생성할 json을 jquery를 이용해 불러온다
            $.get(path, function (data) {
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
                clusterer.addMarkers(markers);
                // 로딩 화면 종료
                closeLoadingWithMask();
                console.log("로딩 완료");
                SelectedDataPaging(data, 1, path);
            });
        }, 1000);
    }
    else {
        $.get(path, function (data) {
            SelectedDataPaging(data, 1, path);
        });

    }
}
// TODO:왜 리턴을 못받냐
/*function getCityMarkJson(path) {
    var tempk = [];
    $.get(path, function (data) {
        tempk = data;
        return tempk;
    });
    return tempk;
}

function clus() {
    console.log(tempd);
}*/

// 지도 위 표시되고 있는 폴리곤 제거
function deletePolygon(polygons) {
    for (var i = 0; i < polygons.length; i++) {
        polygons[i].setMap(null);
    }
    polygons = [];
}

// 지도 위 표시되고 있는 폴리곤 중 선택한 폴리곤을 제외하고 제거
function deletepartPolygon(polygons, part) {
    for (var i = 0; i < polygons.length; i++) {
        if (i != part) {
            polygons[i].setMap(null);
        }
    }
    polygons = [];
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}

// 입력받은 좌표로 부드럽게 이동
function panTo(lat, lng) {
    // 이동할 위도 경도 위치를 생성합니다
    var moveLatLon = new kakao.maps.LatLng(lat, lng);
    // var level = map.getLevel();
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.setLevel('11');
    map.panTo(moveLatLon);
}

// 로딩 화면
function LoadingWithMask() {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth = $(document).width();//window.document.body.clientWidth;

    //화면에 출력할 마스크를 설정해줍니다.
    var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg = '';

    loadingImg += "<div id='loading-image'>";
    loadingImg += " <img src='/css/Rippleslow.gif'/>";
    loadingImg += "</div>";

    //화면에 레이어 추가
    $('body')
        .append(mask)
        .append(loadingImg)

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
        'width': maskWidth
        , 'height': maskHeight
        , 'opacity': '0.3'
    });

    //마스크 표시
    $('#mask').show();

    //로딩중 이미지 표시
    $('#loading-image').show();
}

// 로딩 종료
function closeLoadingWithMask() {
    $('#mask, #loading-image').hide();
    $('#mask, #loading-image').empty();
}