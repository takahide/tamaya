require 'digest/md5'

class TopController < ApplicationController
  def index
    if cookies.permanent['tamaya_id'].present?
      @user_id = cookies.permanent['tamaya_id']
      @clicks = Click.where user_id: @user_id
    else
      @user_id = Digest::MD5.new.update("tamaya#{rand(100000000000)}").to_s
      cookies.permanent['tamaya_id'] = @user_id
      @clicks = []
    end
  end

  def tamaya
    click = Click.new
    click.user_id = cookies.permanent['tamaya_id']
    click.date_time = Time.now
    click.save
  end
end
