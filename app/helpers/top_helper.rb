module TopHelper
  def tamaya 
    content_tag :div do
      @clicks.each do |c|
        today = Time.now.strftime("%Y%m%d")
        jpg_file_name = c.date_time.strftime("%Y%m%d%H%M%S")
        if today == jpg_file_name[0..7]
          concat content_tag :img, "", src: "/images/#{jpg_file_name}/download"
        end
      end
    end
  end
end
