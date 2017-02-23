class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :require_admin!

  skip_before_action :require_admin!, if: :devise_controller?


  def require_admin!
    if current_user
      unless current_user.admin?
        redirect_to root_path
      end
    end
  end
end
