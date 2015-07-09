$(document).on "click", ".admin-submit", ->
  myApp.showPreloader '更新中'
  name = $(".admin .name").val()
  start_time = $(".admin .start_time").val()
  end_time = $(".admin .end_time").val()
  location.href="/admin/#{name}/#{start_time}/#{end_time}"

$(document).on "click", ".to_top", ->
  location.href="/"
