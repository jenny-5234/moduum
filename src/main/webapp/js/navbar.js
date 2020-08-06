// $(document).on('mouseover', '.navbar_Menu', function() {
//     $('.navbar_dept01').stop().slideDown(300);
// });
// $(document).on('mouseout', '.navbar_Menu', function () {
//         $('.navbar_dept01').stop().slideUp(300);
// });

$(".navbar_Menu").mouseover(function () {
    // $(".navbar_dept01").stop().fadeIn(300);
    $(".navbar_dept01").stop().fadeTo(200, 1.0);
});

$(".navbar_Menu").mouseout(function () {
    // $(".navbar_dept01").stop().fadeOut(300);
    $(".navbar_dept01").stop().fadeTo(200, 0);
});

// $(".navbar_Menu").hover(function() {
//     $(this).find(".navbar_dept01").stop().fadeToggle(200);
// });
//
