class RegistrationsController <Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    if params[:password].present?
      resource.update(params)
    else
      resource.update_without_password(params)
    end
  end
end