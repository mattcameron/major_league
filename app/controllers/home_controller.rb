class HomeController < ApplicationController
  before_action :authenticate_user!, only: :inner_sanctum
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
end
