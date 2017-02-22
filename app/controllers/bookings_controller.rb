class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
    @spa = Spa.find(params[:spa_id])
    @massage = Massage.find(params[:massage_id])
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      @spa = Spa.find(params[:spa_id])
      # render 'spas/show'
      flash[:alert]= "Invalid booking please check the form"
      redirect_to spa_path(params[:spa_id])
    end
  end



  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Your booking was successfully cancelled. hope to see you back soon!'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time_in, :massage_id, :spa_id )
  end
end
