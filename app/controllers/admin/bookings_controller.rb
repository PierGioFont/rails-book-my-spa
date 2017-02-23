class Admin::BookingsController < ApplicationController
  def index
    spa = Spa.find(params[:spa_id])
    @bookings = spa.bookings
  end
end
