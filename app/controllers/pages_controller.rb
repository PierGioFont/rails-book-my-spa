class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :login_template ]
  skip_before_action :require_admin!

  def home
    @spas = Spa.limit(3).order("RANDOM()")
  end
end
