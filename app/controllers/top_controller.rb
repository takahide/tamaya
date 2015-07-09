require 'digest/md5'

class TopController < ApplicationController
  def index
    if cookies.permanent['tamaya_id'].present?
      @user_id = cookies.permanent['tamaya_id']
    else
      @user_id = Digest::MD5.new.update("tamaya#{rand(100000000000)}").to_s
      cookies.permanent['tamaya_id'] = @user_id
    end

    @clicks = Click.todays_clicks @user_id
    
    e = Event.newest
    @name = e.name
    @start_time = e.start_time
    @end_time = e.end_time

    st = @start_time.split(":")
    et = @end_time.split(":")
    @start_unix = Time.new(Time.now.year, Time.now.month, Time.now.day, st[0], st[1]).to_i
    @end_unix =  Time.new(Time.now.year, Time.now.month, Time.now.day, et[0], et[1]).to_i
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
      e = Event.newest
      name = e.name
      start_time = e.start_time
      end_time = e.end_time
      st = start_time.split(":")
      et = end_time.split(":")
      for num in 0..23 do
        if num >= st[0].to_i && num <= et[0].to_i
          click = Click.new
          click.user_id = user_id
          click.date_time = Time.new(Time.now.year, Time.now.month, Time.now.day) + num.hours
          click.save

          click = Click.new
          click.user_id = user_id
          click.date_time = Time.new(Time.now.year, Time.now.month, Time.now.day) + num.hours + 30.minutes
          click.save
        end
      end
    end
    click = Click.new
    click.user_id = user_id
    click.date_time = Time.zone.now
    click.save
  end
end
