class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :store_current_location, unless: :devise_controller?

  skip_before_action :require_admin!, if: :devise_controller?


  def require_admin!
    if current_user
      unless current_user.admin?
        redirect_to root_path
      end
    end
  end

  private

  def after_sign_in_path_for(resource)
    session[:redirect_after_log_in] || root_path
  end

  def after_sign_up_path_for(resource)
    session[:redirect_after_log_in] || root_path
  end

  def store_current_location
    session[:redirect_after_log_in] = request.env['PATH_INFO']
  end
end
