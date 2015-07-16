class Event < ActiveRecord::Base
  def self.newest
    newests = self.order("id DESC").limit(1)
    return nil if newests.nil?
    newests[0]
  end

  def start_unix
    start_time = self.start_time
    st = start_time.split(":")
    Time.new(Time.now.year, Time.now.month, Time.now.day, st[0], st[1]).to_i
  end

  def end_unix
    end_time = self.end_time
    et = end_time.split(":")
    Time.new(Time.now.year, Time.now.month, Time.now.day, et[0], et[1]).to_i
  end
end
