class LpController < ApplicationController
  def index
    e = Event.newest
    start_unix = e.start_unix
    end_unix = e.end_unix
    now_unix = Time.now.to_i

    @to_button_img = "btn_01_gray.png"
    @to_my_tamaya_img = "btn_02_gray.png"
    @to_graph_img = "btn_03_gray.png"
    @to_button_onclick = ""
    if now_unix > end_unix
      @to_my_tamaya_img = "btn_02.png"
      @to_my_tamaya_onclick = "location.href='/my-tamaya'"
      @to_graph_img = "btn_03.png"
      @to_graph_onclick = "location.href='/graph'"
    elsif now_unix > start_unix
      @to_button_img = "btn_01.png"
      @to_button_onclick = "location.href='/button'"
    end

    render :layout => 'lp'
  end

  def en
    e = Event.newest
    start_unix = e.start_unix
    end_unix = e.end_unix
    now_unix = Time.now.to_i

    @to_button_img = "btn_01_gray.png"
    @to_my_tamaya_img = "btn_02_gray.png"
    @to_graph_img = "btn_03_gray.png"
    @to_button_onclick = ""
    if now_unix > end_unix
      @to_my_tamaya_img = "btn_02.png"
      @to_my_tamaya_onclick = "location.href='/my-tamaya'"
      @to_graph_img = "btn_03.png"
      @to_graph_onclick = "location.href='/graph'"
    elsif now_unix > start_unix
      @to_button_img = "btn_01.png"
      @to_button_onclick = "location.href='/button'"
    end

    render :layout => 'lp'
  end
end
