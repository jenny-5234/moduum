function goTop() {
    $("#up_button").click(function () {
        $("html, body").animate({scrollTop: 0}, "slow");
        return false;
    })
};