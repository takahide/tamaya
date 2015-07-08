$ ->
  setTimeout ->
    h = $(".menu").css("height");
    $(".time-graph").css("bottom", h)
  , 500

$(document).on "click", ".tamaya-button", ->
  unix = parseInt((new Date)/1000)
  left = parseInt($(".time.start").attr("data-unix"))
  right = parseInt($(".time.end").attr("data-unix"))
  dot = 100 * (unix - left) / (right - left)

  createFirework(46, 81, 2, 3, 50, 50, dot, 80, false, false)

  setTimeout ->
    $(".dot-holder").append("<div class='dot' style='left: #{dot}%;'></div>")
  , 300
  $.ajax {
    type: "GET"
    url: "tamaya"
  }
