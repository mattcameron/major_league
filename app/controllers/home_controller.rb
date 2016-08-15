class HomeController < ApplicationController
  def index
    @events = Event.all
    @users = User.all
    @leader = @users.order_by_points.try(:first)
  end
end
