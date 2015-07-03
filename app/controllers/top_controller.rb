require 'digest/md5'

class TopController < ApplicationController
  def index
    if cookies.permanent['tamaya_id'].present?
      @user_id = cookies.permanent['tamaya_id']
    else
      @user_id = Digest::MD5.new.update("tamaya#{rand(100000000000)}").to_s
      cookies.permanent['tamaya_id'] = @user_id
    end
    
    e = Event.newest
    @name = e.name
    @start_time = e.start_time
    @end_time = e.end_time
  end

  def my_tamaya
    if cookies.permanent['tamaya_id'].present?
      @user_id = cookies.permanent['tamaya_id']
      @clicks = Click.todays_clicks @user_id
    else
      @user_id = Digest::MD5.new.update("tamaya#{rand(100000000000)}").to_s
      cookies.permanent['tamaya_id'] = @user_id
      @clicks = []
    end
    
    e = Event.newest
    @name = e.name
  end

  def tamaya
    user_id = cookies.permanent['tamaya_id']
    if Click.todays_clicks(user_id).size == 0
      click = Click.new
      click.user_id = user_id
      click.date_time = DateTime.strptime("18:00", "%H:%M")
      click.save

      click = Click.new
      click.user_id = user_id
      click.date_time = DateTime.strptime("18:30", "%H:%M")
      click.save
    end
    click = Click.new
    click.user_id = user_id
    click.date_time = Time.now
    click.save
  end
end
