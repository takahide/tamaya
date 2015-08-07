$(document).on "click", ".admin-submit", ->
  myApp.showPreloader '更新中'
  name = $(".admin .name").val()
  event_date = $(".admin .event_date").val()
  start_time = $(".admin .start_time").val()
  end_time = $(".admin .end_time").val()
  location.href="/admin/#{name}/#{start_time}/#{end_time}/#{event_date}"

$(document).on "click", ".to_top", ->
  location.href="/"
