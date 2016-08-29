module ApplicationHelper
  def sign_in_or_up_link
    if cookies[:bro].present?
      link_to 'Log in', new_user_session_path
    else
      link_to 'Sign Up', new_user_registration_path
    end
  end
end
