$(".navbar_Menu").mouseover(function () {
    $(".navbar_dept01").stop().fadeIn(300);
});

$(".navbar_Menu").mouseout(function () {
    $(".navbar_dept01").stop().fadeOut(300);
});
