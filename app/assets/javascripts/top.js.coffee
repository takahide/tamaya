coming = "/coming.jpg"

$ ->
  setTimeout ->
    $("img.tamaya-button").boxCenter()
    h = $(".menu").css("height")
    $(".time-graph").css("bottom", h)
  , 500

  $("img").error ->
    $(@).attr("src", coming)
    new_src = $(".big-image img").attr("src")

$(document).on "click", ".menu a", ->
  myApp.showIndicator '情報取得中'

$(document).on "click", ".open-popup", ->
  src = $(".tamaya-img", @).attr("src")
  file_name_arr = src.split("/")
  jpg_file_name = file_name_arr[file_name_arr.length - 1].split("_")[0] + ".JPG"
  $(".big-image img").attr("src", "http://lastage.info/1/#{jpg_file_name}")
  $(".big-image a").attr("href", "http://lastage.info/1/#{jpg_file_name}")
  $(".small-image img").each ->
    camera = $(@).attr("data-camera")
    $(@).attr("src", "http://lastage.info/#{camera}/#{jpg_file_name}")

$(document).on "click", ".small-image img", ->
  src = $(@).attr("src")
  $(".big-image img").attr("src", src)
  $(".big-image a").attr("href", src)


$(document).on "click", ".tamaya-button", ->
  count = parseInt($(".counter").text())
  count = count + 1
  $(".counter").text(count)

  unix = parseInt((new Date)/1000)
  left = parseInt($(".time.start").attr("data-unix"))
  right = parseInt($(".time.end").attr("data-unix"))
  dot = 100 * (unix - left) / (right - left)

#  createFirework(46, 81, 2, 3, 50, 50, dot, 80, false, false)
  createFirework(46, 81, 2, 3, null, null, null, null, false, false)

  setTimeout ->
    $(".dot-holder").append("<div class='dot' style='left: #{dot}%;'></div>")
  , 300
  $.ajax {
    type: "GET"
    url: "tamaya"
  }

$.fn.boxCenter = ->
  return this.each (i) ->
    w = $(@).width()
    h = $(@).height()
    mtop = (h/2)*(-1)
    mleft = (w/2)*(-1)
    $(@).css({"width": "#{w}px","height": "#{h}px", "top": "47%", "left": "50%", "margin-top": "#{mtop}px", "margin-left": "#{mleft}px"}).css("opacity", "1")
