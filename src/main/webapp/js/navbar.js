/*$(document).on('mouseover', '.navbar_Menu', function() {
    $('.navbar_dept01').slideDown(200);
});
$(document).on('mouseout', '.navbar_Menu', function () {
    // if (!$(this).hasClass('topMenu')) {
        $('.navbar_dept01').slideUp(200);
    // }
});*/

$(".navbar_Menu").hover(function() {
    $(this).find(".navbar_dept01").stop().fadeToggle(200);
});
