class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @spas = Spa.limit(3).order("RANDOM()")
  end
end
