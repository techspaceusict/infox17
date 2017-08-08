function hoverHandle(id)
{
    document.getElementById(id).style.backgroundColor="#f4511e";
}
function hoverHandleRemove(id)
{
    document.getElementById(id).style.backgroundColor="transparent";
}

  $(window).scroll(function(){
      $(".section").css("opacity", 1 - $(window).scrollTop() / 1000);
    });
$(window).scroll(function(){
    $(".section2").css("opacity", 1 - $(window).scrollTop() / 2500);
  });
  $(window).scroll(function(){
      $(".section3").css("opacity", 1 - $(window).scrollTop() / 3300);
    });
    $(window).scroll(function(){
        $(".section4").css("opacity", 1 - $(window).scrollTop() / 64000);
  });
$(function() {
    $(".preload").fadeOut(2000, function() {
        $(".maindiv").fadeIn(200);
        $(".navigator_custom").fadeIn(200);
    });
});


$('.count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
        duration: 4000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now));
        }
    });
});
