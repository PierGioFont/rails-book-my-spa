class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_admin!

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @spa = Spa.find(params[:spa_id])
    @new_review = @spa.booking.build
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
      BookingMailer.booking_confirmation(@booking).deliver_now
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      @spa = Spa.find(params[:spa_id])
      # render 'spas/show'
      flash[:alert]= "Invalid booking please check the form"
      redirect_to spa_path(params[:spa_id])
    end
  end

  def update
   # @booking.content = params[:new_review]['content']
   # @booking.rating = params[:new_review]['rating'].to_i
    #if @booking.save

    if @booking.update(booking_params)
      calc_avg_rating unless @booking.rating.nil?
      flash[:notice] = "review succesfully added"
      redirect_to bookings_path
    else
      flash[:alert] = "invalid review"
      render :new
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
    params.require(:booking).permit(:date, :time_in, :massage_id, :spa_id, :content, :rating )
  end

  def calc_avg_rating
    rated_spa = @booking.spa
    tot_rate = 0
    rated_spa.bookings.each do |bking|
      tot_rate += bking.rating unless bking.rating.nil?
    end
    #byebug
    rated_spa.upd_avg_rating(tot_rate+@booking.rating, rated_spa.bookings.count + 1)
  end
end

