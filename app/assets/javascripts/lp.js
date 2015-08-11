$(function () {
    $("#menu_01").click(function () {
        if ($(".about").hasClass("open")) {
            $(".about").removeClass("open");
            $(".about").slideToggle();
            $(".bg").animate({
                "height": "1000px"
            }, 1000);
        } else {
            $(".about").slideToggle();
            $(".bg").animate({
                "height": "2000px"
            }, 1000);
            $(".about").addClass("open");
        }
    });
});
$(function () {
    $("#menu_02").click(function () {
        if ($(".usable").hasClass("open")) {
            $(".usable").removeClass("open");
            $(".usable").slideToggle();
            if ((".about").hasClass("open")) {
                $(".bg").animate({
                    "height": "2000px"
                }, 1000);
            } else {
                $(".bg").animate({
                    "height": "1000px"
                }, 1000);
            }
        } else {
            $(".usable").slideToggle();
            $(".usable").addClass("open");
            if ((".about").hasClass("open")) {
                $(".bg").animate({
                    "height": "3000px"
                }, 1000);
            } else {
                $(".bg").animate({
                    "height": "1500px"
                }, 1000);
            }
        }
    });
});
