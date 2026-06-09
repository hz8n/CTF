class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to login_path, alert: "Please log in first." unless logged_in?
  end

  def require_student
    redirect_to admin_root_path if current_user&.admin?
  end

  def require_admin
    redirect_to dashboard_path, alert: "Admin access only." unless current_user&.admin?
  end
end
