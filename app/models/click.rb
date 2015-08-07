class Click < ActiveRecord::Base
  def self.todays_clicks user_id
    date = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day)
    self.where(date_time: date..date.tomorrow, user_id: user_id).order("date_time")
  end

  def self.users_clicks user_id
    self.where(user_id: user_id).order("date_time")
  end
end
