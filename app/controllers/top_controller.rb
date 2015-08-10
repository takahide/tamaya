require 'digest/md5'

class TopController < ApplicationController

  def lp

  end

  def index
    if cookies.permanent['tamaya_id'].present?
      @user_id = cookies.permanent['tamaya_id']
    else
      @user_id = Digest::MD5.new.update("tamaya#{rand(100000000000)}").to_s
      cookies.permanent['tamaya_id'] = @user_id
    end

    @clicks = Click.users_clicks @user_id
    
    e = Event.newest

    @name = e.name
    @start_time = e.start_time
    @end_time = e.end_time
    @start_unix = e.start_unix
    @end_unix = e.end_unix

    @now_unix = Time.now.to_i

    if @now_unix < @start_unix
      render "lp" 
    end

    if @now_unix > @end_unix
      render "my_tamaya"
    end
  end

  def my_tamaya
    if cookies.permanent['tamaya_id'].present?
      @user_id = cookies.permanent['tamaya_id']
      @clicks = Click.users_clicks @user_id
    else
      @user_id = Digest::MD5.new.update("tamaya#{rand(100000000000)}").to_s
      cookies.permanent['tamaya_id'] = @user_id
      @clicks = []
    end
    
    e = Event.newest
    @name = e.name
    @start = e.start_time.delete(":") + "00"
    @end = e.end_time.delete(":") + "00"
  end

  def graph
    @clicks = Click.group(:time_int).count
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
    click = Click.new
    click.user_id = user_id
    date_time = Time.zone.now
    click.date_time = date_time
    month =  date_time.month
    day =  date_time.day
    hour =  date_time.hour
    min =  date_time.min
    click.time_int = month*1000000 + day*10000 + hour*100 + min
    click.save
  end
end
