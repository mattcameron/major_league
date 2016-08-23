class HomeController < ApplicationController
  def index
    @events = Event.all
    @users = User.all
    @leader = @users.order_by_points.try(:first)
    @next_event = @events.where('event_date > ?', Time.zone.now).order(event_date: :asc).first
  end
end
