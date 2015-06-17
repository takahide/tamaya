$ ->
  $(".tamaya-button").click ->
    $.ajax {
      type: "GET"
      url: "tamaya"
    }
