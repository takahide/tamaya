module TopHelper
  def time_graph
    content_tag :div, class: "dot-holder" do
    @count = 0
      @clicks.each do |c|
        next if c.date_time.min == 0 || c.date_time.min == 30
        unixtime = c.date_time.to_i
        left = 100 * (unixtime - @start_unix) / (@end_unix.to_f - @start_unix)
        concat content_tag(:div, "", class: "dot", style:"left: #{left}%")
        @count += 1
      end
    end
  end

  def tamaya 
    content_tag :div do
      index = 0
      @clicks.each do |c|
        today = Time.now.strftime("%Y%m%d")
        start_int = @start.to_i
        end_int = @end.to_i
        jpg_file_name = c.date_time.strftime("%Y%m%d%H%M%S")
        if jpg_file_name[10..13] == "3000" || jpg_file_name[10..13] == "0000"
          #next unless start_int <= jpg_file_name[8..13].to_i && jpg_file_name[8..13].to_i <= end_int
          year = c.date_time.strftime("%Y").to_i
          month = c.date_time.strftime("%m").to_i
          day = c.date_time.strftime("%d").to_i
          time = c.date_time.strftime("%k:%M")
          day_of_week = c.date_time.strftime("%a").upcase
          html = "<span class='small'>#{month}.#{day}</span><br><span class='normal'>#{time}</span><br><span class='small'>#{day_of_week}</span>"
          concat content_tag(:div, content_tag(:div, raw(html), class: "white-time"), class: "white-time-holder")
        elsif start_int <= jpg_file_name[8..13].to_i && jpg_file_name[8..13].to_i <= end_int
          concat content_tag(:div, content_tag(:img, "", src: "http://lastage.info/1/#{jpg_file_name}_thum.jpg", class: "tamaya-img", id: index), class: "tamaya-img-holder open-popup")
          index += 1
        end
      end
      concat content_tag(:div, "", style: "width: 100%; height: 60px; background: #000; display: inline-block;", id: index, class: "tamaya-count")
    end
  end
end
