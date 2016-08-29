class HomeController < ApplicationController
  before_action :authenticate_user!, only: :inner_sanctum
  before_action :set_bro_cookie, only: :inner_sanctum
  def index
    @events = Event.all
    @users = User.all
    @leader = @users.order_by_points.try(:first)
    @next_event = @events.where('event_date > ?', Time.zone.now).order(event_date: :asc).first
  end

  def inner_sanctum
    @user = current_user
    @users = User.all
    @event = @user.hosted_event
  end

  def set_bro_cookie
    cookies[:bro] = {
      value: 'cookie monster',
      expires: 1.year.from_now
    }
  end
end
