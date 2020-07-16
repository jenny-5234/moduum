// 페이지가 로딩되었을 때
$(document).ready(function () {
    // 체크박스가 변경될 때
    $("#clustercleared").change(function () {
        // 체크박스가 체크된경우
        if ($("#clustercleared").is(":checked")) {
            // alert 창을 띄우고 확인 버튼을 누를경우
            if (confirm("클러스터를 활성화 하는 경우 로딩시간이 길어질 수 있습니다.") == true) {
                clusterchecked = true;
            }
            // 취소 버튼을 누를 경우
            else {
                $("#clustercleared").prop("checked", false);
                clusterchecked = false;
            }
        }
        // 체크박스가 해제된 경우
        else {
            clusterchecked = false;
        }
    });
    $("#area").change(function () {
        if ($("#area option:selected").val() == "경기도") {
            $("#clustercleared").prop("disabled", false);
        }
        else {
            $("#clustercleared").prop("checked", false);
            clusterchecked = false;
            $("#clustercleared").prop("disabled", true);
        }
    });

    $("#shadowclose").click(function () {
        $("#menu_wrap").toggle();
        if ($("#menu_wrap").css("display") == "none") {
            $("#shadowclose").css("margin","340px 0px 0px 0px");
            $(this).val('>');
        }
        else {
            $("#shadowclose").css("margin","340px 0px 0px 360px");
            $(this).val('<');
        }
    });
});

function regionSelection() {
    var selectedCity = document.getElementById('area').value;

    switch (selectedCity) {
        case("none"):
            // 선택했을 때 마커, 폴리곤, itemElement, page, 클러스터를 초기화
            initialization();
            break;
        case("서울"):
            getjson('../../../location/seouldetail.json', '서울');
            panTo(37.566833213145486, 126.97865508601613);
            break;
        case("경기도"):
            getjson('../../../location/ggidodetail.json', '경기도');
            panTo(37.552246098709894, 127.08265827817051);
            break;
        case("인천"):
            getjson('../../../location/incheon.json', '인천');
            panTo(37.45601575635058, 126.70526932805312);
            break;
        case("대전"):
            getjson('../../../location/daejeon.json', '대전');
            panTo(36.35054566698088, 127.38483209496621);
            break;
        case("대구"):
            getjson('../../../location/daegu.json', '대구');
            panTo(35.87139021883816, 128.60180236999602);
            break;
        case("세종특별자치시"):
            getjson('../../../location/sejong.json', '세종특별자치시');
            panTo(36.480076633106535, 127.28919257852753);
            break;
        case("강원도"):
            getjson('../../../location/gangwondo.json', '강원도');
            panTo(37.88533434764741, 127.72982852649373);
            break;
        case("충청북도"):
            getjson('../../../location/chungcheongbukdo.json', '충청북도');
            panTo(36.63536856332988, 127.49145627422729);
            break;
        case("충청남도"):
            getjson('../../../location/chungcheongnamdo.json', '충청남도');
            panTo(36.658839597743665, 126.67276943924477);
            break;
        case("경상북도"):
            getjson('../../../location/gyeongsangbukdo.json', '경상북도');
            panTo(36.57600343933538, 128.505798836928);
            break;
        case("경상남도"):
            getjson('../../../location/gyeongsangnamdo.json', '경상남도');
            panTo(35.237709423780196, 128.69192190637102);
            break;
        case("부산광역시"):
            getjson('../../../location/busan.json', '부산광역시');
            panTo(35.179750947369214, 129.07507091757356);
            break;
        case("울산광역시"):
            getjson('../../../location/ulsan.json', '울산광역시');
            panTo(35.5394845888991, 129.31146797079748);
            break;
        case("전라북도"):
            getjson('../../../location/jeollabukdo.json', '전라북도');
            panTo(35.82020672844053, 127.10897672617733);
            break;
        case("광주광역시"):
            getjson('../../../location/gwangju.json', '광주광역시');
            panTo(35.160108723530996, 126.85163269066601);
            break;
        case("전라남도"):
            getjson('../../../location/jeollanamdo수정.json', '전라남도');
            panTo(34.81609068924449, 126.46278335953988);
            break;
        case("제주도"):
            getjson('../../../location/jeju.json', '제주도');
            panTo(33.48892014636885, 126.49822643823065);
            break;
        case("울릉군"):
            getjson('../../../location/ulleungdo.json', '울릉군');
            panTo(37.484448241659884, 130.905715980063);
            break;
        default:
            alert("오류가 발생하였습니다. 관리자에게 문의해주세요.");
    }
}