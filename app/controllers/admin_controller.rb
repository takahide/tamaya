class AdminController < ApplicationController
  def index

  end

  def edit
    @name = params[:name]
    @start_time = params[:start_time]
    @end_time = params[:end_time]
    e = Event.new
    e.name = @name
    e.start_time = @start_time
    e.end_time = @end_time
    e.save
  end
end