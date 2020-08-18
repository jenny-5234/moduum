function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
$(".sub_menu").hide();

$(".sub_nav").on('click', function () {
    $(this).next(".sub_menu").slideToggle(100);
});

function mask() {
    var maskHeight = $(document).height();
    var maskWidth = $(document).width();//window.document.body.clientWidth;

    var mask = "<div id='mask' style='position:absolute; z-index:2; background-color:#000000; display:none; left:0; top:0;'>" +
        "</div>";

    $('body')
        .append(mask)

    $('#mask').css({
        'width': maskWidth
        , 'height': maskHeight
        , 'opacity': '0.3'
    });

//마스크 표시
    $('#mask').show();
}

function closeMask() {
    $('#mask').hide();
    $('#mask').empty();
}

//
// $(document).on('mouseover', '.sub_nav', function() {
//     $('.sub_menu').stop().slideDown(300);
// });
// $(document).on('mouseout', '.navbar_Menu', function () {
//         $('.sub_menu').stop().slideUp(300);
// });
