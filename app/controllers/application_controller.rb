class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_superadmin_user!
    authenticate_user!

    unless current_user.super_admin?
      redirect_to root_path, alert: "Unauthorized Access!"
    end
  end

end
