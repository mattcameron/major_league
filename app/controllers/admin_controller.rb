class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  def check_admin
    unless current_user.site_admin?
      redirect_to root_path, flash: { warning: "Get your bloody mitts out of here. This is for legends only" }
    end
  end
end