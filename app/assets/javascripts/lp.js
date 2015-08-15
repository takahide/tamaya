$(function () {
    $("#menu_01").click(function () {
        if ($(".about").hasClass("open")) {
            $(".about").removeClass("open");
            $(".about").slideToggle();
            $(".bg").animate({
                "height": "1500px"
            }, 1000);
            $("#menu_01").attr("src", "/about_btn.png");
	    
        } else {
            $(".about").slideToggle();
            $(".bg").animate({
                "height": "3000px"
            }, 1000);
            $(".about").addClass("open");
	    $("#menu_01").attr("src", "/howto_btn.png");
        }
    });
});
$(function () {
    $("#menu_02").click(function () {
        if ($(".usable").hasClass("open")) {
            $(".usable").removeClass("open");
            $(".usable").slideToggle();
            $("#menu_02").attr("src", "/usable_btn.png");
            if ($("section.about").hasClass("open")) {
                $(".bg").animate({
                    "height": "3500px"
                }, 1000);
            } else {
                $(".bg").animate({
                    "height": "1500px"
                }, 1000);
            }
        } else {
            $(".usable").slideToggle();
            $(".usable").addClass("open");
            $("#menu_02").attr("src", "/usable_btn_active.png");
            if ($("section.about").hasClass("open")) {
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
