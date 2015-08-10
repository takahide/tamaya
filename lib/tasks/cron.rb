class Cron
  def self.add_time_int
    Click.find_each do |c|
      month =  c.date_time.month
      day =  c.date_time.day
      hour =  c.date_time.hour
      min =  c.date_time.min
      c.time_int = month*1000000 + day*10000 + hour*100 + min
      c.save
    end
  end
end
