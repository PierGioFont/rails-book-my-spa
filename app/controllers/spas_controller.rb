class SpasController < ApplicationController
  before_action :set_spa, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params['where'].nil? || params['where'].empty?
      @spas = Spa.all
    else
      # @spas = Spa.where("lower(address) LIKE ? ", "%#{params['where'].downcase}%")
      @spas = Spa.near(params['where'], 100)
      # @flats = Flat.where.not(latitude: nil, longitude: nil)

      @hash = Gmaps4rails.build_markers(@spas) do |spa, marker|
        marker.lat spa.latitude
        marker.lng spa.longitude
        # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      end
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
