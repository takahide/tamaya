$(document).on "click", ".tamaya-button", ->
  createFirework(46, 81, 2, 3, 50, 50, null, null, false, false)
  $.ajax {
    type: "GET"
    url: "tamaya"
  }

$(document).on "touchstart", ".tamaya-button", ->
  setTimeout ->
    $(".tamaya-button").css("opacity", ".3")
  , 3000
