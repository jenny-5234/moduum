// $(document).on('mouseover', '.topMenu span', function() {
//     $('.dept01').slideDown(200);
// });
// $(document).on('mouseout', 'div', function () {
//     if (!$(this).hasClass('topMenu')) {
//         $('.dept01').slideUp(200);
//     }
// });
$(".navbar_Menu").hover(function() {
    $(this).find(".dept01").stop().fadeToggle(200);
});
