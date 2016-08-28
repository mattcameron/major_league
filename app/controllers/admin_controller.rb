class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  def check_admin
    unless current_user.chief?
      redirect_to root_path, flash: { warning: "Get your bloody Indian mitts out of here. This is for Chiefs only" }
    end
  end
end