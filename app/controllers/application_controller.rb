class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_error_notification_data

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    inner_sanctum_path
  end

  def set_error_notification_data
    extra_data = {
      "server" => request.env['SERVER_NAME']
    }
    if current_user.present?
      extra_data[:user_name] = current_user.try(:name)
      extra_data[:user_email] = current_user.try(:email)
    end

    request.env['exception_notifier.exception_data'] = extra_data
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
