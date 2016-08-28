class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    inner_sanctum_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [
        :name,
        :email,
        :password,
        :password_confirmation,
        :nickname,
        :bio,
        :image,
        skills_attributes: [
          :id,
          :name,
          :value,
          :user_id
        ]
      ]
    )
  end
end
