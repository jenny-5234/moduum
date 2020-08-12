$(".sub_nav").on('click',function(){
    $(this).next(".sub_menu").slideToggle(100);
});

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
//
// $(document).on('mouseover', '.sub_nav', function() {
//     $('.sub_menu').stop().slideDown(300);
// });
// $(document).on('mouseout', '.navbar_Menu', function () {
//         $('.sub_menu').stop().slideUp(300);
// });
