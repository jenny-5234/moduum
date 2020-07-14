// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
// var infowindow = new kakao.maps.InfoWindow({
//     zIndex: 1
// });

// 클릭시 좌표를 콘솔에 출력
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // 클릭한 위도, 경도 정보를 가져옵니다
    var latlng = mouseEvent.latLng;
    // var latlng = map.getCenter();

    console.log(latlng.getLat());
    console.log(latlng.getLng());

});

// 데이터를 넣을 때 콘솔에 json으로 출력함
var gunpo_str = "";
function makejson(places) {
    for (var i = 0; i < places.length; i++) {
        var gunpo = {
            SIGUN_NM: "군포시",
            place_name: places[i].place_name,
            INDUTYPE_NM: places[i].category_name,
            road_address_name: places[i].road_address_name,
            address_name: places[i].address_name,
            phone: places[i].phone,
            REFINE_ZIPNO: "",
            y: places[i].y,
            x: places[i].x,
            place_url: places[i].place_url,
            id: places[i].id,
        }

        gunpo_str += JSON.stringify(gunpo);


    }
    console.log(gunpo_str);
    gunpo_str = "";
}


// 클러스터 생성
/*function makecluster(path, x, y, maplevel) {
    var tmpd = getCityMarkJson(path);
    console.log(tmpd);
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
        LoadingWithMask();   // 클러스터 미리 생성할 시 활성화
        setTimeout(function () {
            // 로딩 화면 보여줌
            // LoadingWithMask();
            // 클러스터를 생성한 json을 jquery를 이용해 불러온다
            // $.get(path, function (data) {
                // 전에 있던 Element와 페이지를 지운다
                /!*var listEl = document.getElementById('placesList');

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
                });*!/
                // 클러스터 미리 저장

                switch (path) {
                    case("../../../city_mark_info/kimpo.json"): clusterer.addMarkers(kimp); console.log("김포"); break;
                    case("../../../city_mark_info/gapyeong.json"): clusterer.addMarkers(gapyeong); console.log("가평"); break;
                    case("../../../city_mark_info/ansan.json"): clusterer.addMarkers(ansan); break;
                    case("../../../city_mark_info/anseong.json"): clusterer.addMarkers(anseong); break;
                    case("../../../city_mark_info/anyang.json"): clusterer.addMarkers(anyang); break;
                    case("../../../city_mark_info/bucheon.json"): clusterer.addMarkers(bucheon); break;
                    case("../../../city_mark_info/dongducheon.json"): clusterer.addMarkers(dongducheon); break;
                    case("../../../city_mark_info/goyang.json"): clusterer.addMarkers(goyang); break;
                    case("../../../city_mark_info/gunpo.json"): clusterer.addMarkers(gunpo); break;
                    case("../../../city_mark_info/guri.json"): clusterer.addMarkers(guri); break;
                    case("../../../city_mark_info/gwacheon.json"): clusterer.addMarkers(gwacheon); break;
                    case("../../../city_mark_info/gwangju.json"): clusterer.addMarkers(gwangju); break;
                    case("../../../city_mark_info/gwangmyeong.json"): clusterer.addMarkers(gwangmyeong); break;
                    case("../../../city_mark_info/hanam.json"): clusterer.addMarkers(hanam); break;
                    case("../../../city_mark_info/hwaseong.json"): clusterer.addMarkers(hwaseong); break;
                    case("../../../city_mark_info/icheon.json"): clusterer.addMarkers(icheon); break;
                    case("../../../city_mark_info/namyangju.json"): clusterer.addMarkers(namyangju); break;
                    case("../../../city_mark_info/osan.json"): clusterer.addMarkers(osan); break;
                    case("../../../city_mark_info/paju.json"): clusterer.addMarkers(paju); break;
                    case("../../../city_mark_info/pocheon.json"): clusterer.addMarkers(pocheon); break;
                    case("../../../city_mark_info/pyeongtaek.json"): clusterer.addMarkers(pyeongtaek); break;
                    case("../../../city_mark_info/seongnam.json"): clusterer.addMarkers(seongnam); break;
                    case("../../../city_mark_info/siheung.json"): clusterer.addMarkers(siheung); break;
                    case("../../../city_mark_info/suwon.json"): clusterer.addMarkers(suwon); break;
                    case("../../../city_mark_info/uijeongbu.json"): clusterer.addMarkers(uijeongbu); break;
                    case("../../../city_mark_info/uiwang.json"): clusterer.addMarkers(uiwang); break;
                    case("../../../city_mark_info/yangju.json"): clusterer.addMarkers(yangju); break;
                    case("../../../city_mark_info/yangpyeong.json"): clusterer.addMarkers(yangpyeong); break;
                    case("../../../city_mark_info/yeoju.json"): clusterer.addMarkers(yeoju); break;
                    case("../../../city_mark_info/yeoncheon.json"): clusterer.addMarkers(yeoncheon); break;
                    case("../../../city_mark_info/yongin.json"): clusterer.addMarkers(yongin); break;
                }
                // 로딩 화면 종료
                closeLoadingWithMask();
                console.log("로딩 완료");
                SelectedDataPaging(data, 1, path);
            // });
        }, 1000);
    }
    else {
        $.get(path, function (data) {
            SelectedDataPaging(data, 1, path);
        });

    }
}*/


// 파일로 저장 실패, 데이터베이스에 저장하는 방법을 생각 했으나 또 다시 JSON.stringify 로 인해 실패
// 6초 -> 3초 20초-> 12초로 줄어드는 것은 확인은 했지만 markers를 json으로 변환하는것을 못함
// JSON.stringify를 사용하면 함수가 사라지는 문제때문에 안됨
// 최종적으로 불가능
/*var kimp = "";
var gapyeong = "";
var ansan = "";
var anseong = "";
var anyang = "";
var bucheon = "";
var dongducheon = "";
var goyang = "";
var gunpo = "";
var guri = "";
var gwacheon = "";
var gwangju = "";
var gwangmyeong = "";
var hanam = "";
var hwaseong = "";
var icheon = "";
var namyangju = "";
var osan = "";
var paju = "";
var pocheon = "";
var pyeongtaek = "";
var seongnam = "";
var siheung = "";
var suwon = "";
var uijeongbu = "";
var uiwang = "";
var yangju = "";
var yangpyeong = "";
var yeoju = "";
var yeoncheon = "";
var yongin = "";*/

// 체크
/*function ch() {
    // console.log(kimp);
    // console.log(gapyeong);
    // console.log(gunpo);
    $.ajax({ //ajax start!
        url: "test.jsp", //ajax를 실행할 파일 경로
        type: "POST", //전송방식 POST와 GET 중에 하나
        data: kimp, //전송방식이 POST일 경우에 전송할 데이터들을 나열해준다
        dataType: "json",
        success: function(data){ //전송성공!
            console.log(data); //콘솔창에 데이터 찍어보기(배열 데이터가 출력됨)
        }
    });
}*/

// 클러스터를 변수에 미리 저장
/*function clus() {
    console.log("눌렀");
    /!*tras("../../../city_mark_info/kimpo.json");
    tras("../../../city_mark_info/gapyeong.json");
    tras("../../../city_mark_info/ansan.json");
    tras("../../../city_mark_info/anseong.json");
    tras("../../../city_mark_info/anyang.json");
    tras("../../../city_mark_info/bucheon.json");
    tras("../../../city_mark_info/dongducheon.json");
    tras("../../../city_mark_info/goyang.json");
    tras("../../../city_mark_info/gunpo.json");
    tras("../../../city_mark_info/guri.json");
    tras("../../../city_mark_info/gwacheon.json");
    tras("../../../city_mark_info/gwangju.json");
    tras("../../../city_mark_info/gwangmyeong.json");
    tras("../../../city_mark_info/hanam.json");
    tras("../../../city_mark_info/hwaseong.json");
    tras("../../../city_mark_info/icheon.json");
    tras("../../../city_mark_info/namyangju.json");
    tras("../../../city_mark_info/osan.json");
    tras("../../../city_mark_info/paju.json");
    tras("../../../city_mark_info/pocheon.json");
    tras("../../../city_mark_info/pyeongtaek.json");
    tras("../../../city_mark_info/seongnam.json");
    tras("../../../city_mark_info/siheung.json");
    tras("../../../city_mark_info/suwon.json");
    tras("../../../city_mark_info/uijeongbu.json");
    tras("../../../city_mark_info/uiwang.json");
    tras("../../../city_mark_info/yangju.json");
    tras("../../../city_mark_info/yangpyeong.json");
    tras("../../../city_mark_info/yeoju.json");
    tras("../../../city_mark_info/yeoncheon.json");
    tras("../../../city_mark_info/yongin.json");*!/
}*/

/*
function tras(path) {
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
        switch (path) {
            case("../../../city_mark_info/kimpo.json"): kimp = markers; console.log("김포저장완료"); break;
            case("../../../city_mark_info/gapyeong.json"): gapyeong= markers; console.log("가평"); break;
            case("../../../city_mark_info/ansan.json"): ansan= markers; console.log("안산"); break;
            case("../../../city_mark_info/anseong.json"): anseong= markers; console.log("안성"); break;
            case("../../../city_mark_info/anyang.json"): anyang= markers; console.log("안양"); break;
            case("../../../city_mark_info/bucheon.json"): bucheon= markers; console.log("부천"); break;
            case("../../../city_mark_info/dongducheon.json"): dongducheon= markers; console.log("동두천"); break;
            case("../../../city_mark_info/goyang.json"): goyang= markers; console.log("고양"); break;
            case("../../../city_mark_info/gunpo.json"): gunpo = markers; console.log("군포"); break;
            case("../../../city_mark_info/guri.json"): guri= markers; console.log("구리"); break;
            case("../../../city_mark_info/gwacheon.json"): gwacheon= markers; console.log("과천"); break;
            case("../../../city_mark_info/gwangju.json"): gwangju= markers; console.log("광주"); break;
            case("../../../city_mark_info/gwangmyeong.json"): gwangmyeong= markers; console.log("광명"); break;
            case("../../../city_mark_info/hanam.json"): hanam= markers; console.log("하남"); break;
            case("../../../city_mark_info/hwaseong.json"): hwaseong= markers; console.log("화성"); break;
            case("../../../city_mark_info/icheon.json"): icheon= markers; console.log("이천"); break;
            case("../../../city_mark_info/namyangju.json"): namyangju= markers; console.log("남양주"); break;
            case("../../../city_mark_info/osan.json"): osan= markers; console.log("오산"); break;
            case("../../../city_mark_info/paju.json"): paju= markers; console.log("파주"); break;
            case("../../../city_mark_info/pocheon.json"): pocheon= markers; console.log("포천"); break;
            case("../../../city_mark_info/pyeongtaek.json"): pyeongtaek= markers; console.log("평택"); break;
            case("../../../city_mark_info/seongnam.json"): seongnam= markers; console.log("성남"); break;
            case("../../../city_mark_info/siheung.json"): siheung= markers; console.log("시흥"); break;
            case("../../../city_mark_info/suwon.json"): suwon= markers; console.log("수원"); break;
            case("../../../city_mark_info/uijeongbu.json"): uijeongbu= markers; console.log("의정부"); break;
            case("../../../city_mark_info/uiwang.json"): uiwang= markers; console.log("의왕"); break;
            case("../../../city_mark_info/yangju.json"): yangju= markers; console.log("양주"); break;
            case("../../../city_mark_info/yangpyeong.json"): yangpyeong= markers; console.log("양평"); break;
            case("../../../city_mark_info/yeoju.json"): yeoju= markers; console.log("여주"); break;
            case("../../../city_mark_info/yeoncheon.json"): yeoncheon= markers; console.log("연천"); break;
            case("../../../city_mark_info/yongin.json"): yongin= markers; console.log("용인"); break;
        }
    });
}*/
