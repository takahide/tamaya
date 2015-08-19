coming = "/coming.jpg"
button_lock = 0
slide = 0

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
  id = parseInt $("img", @).attr("id")
  $(".popup .next").attr("next", id + 1)
  $(".popup .prev").attr("prev", id - 1)
  slide = id

  if id == 0
    $(".popup .prev").css("display", "none")

  if id == parseInt($(".tamaya-count").attr("id")) - 1
    $(".popup .next").css("display", "none")

  src = $(".tamaya-img", @).attr("src")
  file_name_arr = src.split("/")
  jpg_file_name = file_name_arr[file_name_arr.length - 1].split("_")[0] + ".jpg"
  $(".big-image img").attr("src", "http://lastage.info/1/#{jpg_file_name}")
  $(".big-image a").attr("href", "http://lastage.info/1/#{jpg_file_name}")
  $(".small-image img").each ->
    camera = $(@).attr("data-camera")
    $(@).attr("src", "http://lastage.info/#{camera}/#{jpg_file_name}")

$(document).on "click", ".popup .next", ->
  slide = parseInt($(@).attr("next"))
  $(".popup .prev").css("display", "block").attr("prev", slide - 1)
  $(".popup .next").css("display", "block").attr("next", slide + 1)
  if slide == 0
    $(".popup .prev").css("display", "none")
  if slide == parseInt($(".tamaya-count").attr("id")) - 1
    $(".popup .next").css("display", "none")

  src = $("##{slide}").attr("src")
  file_name_arr = src.split("/")
  jpg_file_name = file_name_arr[file_name_arr.length - 1].split("_")[0] + ".jpg"
  $(".big-image img").attr("src", "http://lastage.info/1/#{jpg_file_name}")
  $(".big-image a").attr("href", "http://lastage.info/1/#{jpg_file_name}")
  $(".small-image img").each ->
    camera = $(@).attr("data-camera")
    $(@).attr("src", "http://lastage.info/#{camera}/#{jpg_file_name}")

$(document).on "click", ".popup .prev", ->
  slide = parseInt($(@).attr("prev"))
  $(".popup .prev").css("display", "block").attr("prev", slide - 1)
  $(".popup .next").css("display", "block").attr("next", slide + 1)
  $(".popup .prev").css("display", "block")
  $(".popup .next").css("display", "block")
  if slide == 0
    $(".popup .prev").css("display", "none")
  if slide == parseInt($(".tamaya-count").attr("id")) - 1
    $(".popup .next").css("display", "none")

  src = $("##{slide}").attr("src")
  file_name_arr = src.split("/")
  jpg_file_name = file_name_arr[file_name_arr.length - 1].split("_")[0] + ".jpg"
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
  rand = Math.floor( Math.random() * 12 ) + 1
  se = $("#tamaya#{rand}")
  se[0].currentTime = 0
  se[0].play()

  unix = parseInt((new Date)/1000)
  left = parseInt($(".time.start").attr("data-unix"))
  right = parseInt($(".time.end").attr("data-unix"))
  dot = 100 * (unix - left) / (right - left)

#  createFirework(46, 81, 2, 3, 50, 50, dot, 80, false, false)
  createFirework(46, 81, 2, 3, null, null, null, null, false, false)

  setTimeout ->
    $(".dot-holder").append("<div class='dot' style='left: #{dot}%;'></div>")
  , 300

  date = new Date()
  year = date.getFullYear()
  month = date.getMonth() + 1
  day = date.getDate()
  hour = date.getHours()
  minute = date.getMinutes()
  second = date.getSeconds()

  if button_lock == 0
    $.ajax {
      type: "GET"
      url: "tamaya/#{year}/#{month}/#{day}/#{hour}/#{minute}/#{second}"
    }
    count = parseInt($(".counter").text())
    count = count + 1
    $(".counter").text(count)

    button_lock = 1
    setTimeout ->
      button_lock = 0
    , 1000

$.fn.boxCenter = ->
  return this.each (i) ->
    w = $(@).width()
    h = $(@).height()
    mtop = (h/2)*(-1)
    mleft = (w/2)*(-1)
    $(@).css({"width": "#{w}px","height": "#{h}px", "top": "47%", "left": "50%", "margin-top": "#{mtop}px", "margin-left": "#{mleft}px"}).css("opacity", "1")
