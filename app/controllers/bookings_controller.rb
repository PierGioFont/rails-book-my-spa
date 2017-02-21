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

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Your booking was successfully cancelled. hope to see you back soon!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      # byebug
      params.require(:booking).permit(:date, :time_in, :massage_id, :spa_id )
    end
end
