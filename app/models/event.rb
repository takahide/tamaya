class Event < ActiveRecord::Base
  def self.newest
    newests = self.order("id DESC").limit(1)
    return nil if newests.nil?
    newests[0]
  end

  def start_unix
    event_date = self.event_date
    start_time = self.start_time
    d = event_date.split("-")
    st = start_time.split(":")
    Time.new(d[0], d[1], d[2], st[0], st[1]).to_i
  end

  def end_unix
    event_date = self.event_date
    end_time = self.end_time
    d = event_date.split("-")
    et = end_time.split(":")
    Time.new(d[0], d[1], d[2], et[0], et[1]).to_i
  end
end
