class Admin::BookingsController < ApplicationController
  def index
    # Let's anticipate on next week (with login)
    spa = Spa.find(params[:spa_id])
    @bookings = spa.bookings


  end
end
