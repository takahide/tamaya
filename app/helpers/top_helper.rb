module TopHelper
  def time_graph
    content_tag :div, class: "dot-holder" do
      @clicks.each do |c|
        next if c.date_time.min == 0 || c.date_time.min == 30
        unixtime = c.date_time.to_i
        left = 100 * (unixtime - @start_unix) / (@end_unix.to_f - @start_unix)
        concat content_tag(:div, "", class: "dot", style:"left: #{left}%")
      end
    end
  end

  def tamaya 
    content_tag :div do
      @clicks.each do |c|
        today = Time.now.strftime("%Y%m%d")
        jpg_file_name = c.date_time.strftime("%Y%m%d%H%M%S")
        if jpg_file_name[10..13] == "3000" || jpg_file_name[10..13] == "0000"
          month = c.date_time.strftime("%m").to_i
          day = c.date_time.strftime("%d").to_i
          time = c.date_time.strftime("%k:%M")
          day_of_week = c.date_time.strftime("%a").upcase
          html = "<span class='small'>#{month}.#{day}</span><br><span class='normal'>#{time}</span><br><span class='small'>#{day_of_week}</span>"
          concat content_tag(:div, content_tag(:div, raw(html), class: "white-time"), class: "white-time-holder")
        elsif today == jpg_file_name[0..7]
          concat content_tag(:div, content_tag(:img, "", src: "/images/#{jpg_file_name}", class: "tamaya-img"), class: "tamaya-img-holder open-popup")
        end
      end
    end
  end
end
