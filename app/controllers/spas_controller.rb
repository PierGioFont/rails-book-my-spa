class SpasController < ApplicationController
  before_action :set_spa, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params['where'].nil?
      @spas = Spa.all
    else
      @spas = Spa.where("lower(address) LIKE ? ", "%#{params['where'].downcase}%")
      if @spas.empty?
        flash[:alert]= "No Spa found with this criteria"
        redirect_to root_path
      end
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @spa = Spa.new
  end

  private

  def set_spa
    @spa = Spa.find(params[:id])
  end
end
