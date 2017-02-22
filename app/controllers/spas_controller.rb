class SpasController < ApplicationController
  before_action :set_spa, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params['where'].nil? || params['where'].empty?
      @spas = Spa.all
    #elsif params['dist'].nil?
      #@spas = Spa.where("lower(address) LIKE ? ", "%#{params['where'].downcase}%")
    else
      dist = params['dist'].nil? ? 100 : params['dist'].to_i
      @spas = Spa.near(params['where'], dist)
      # @flats = Flat.where.not(latitude: nil, longitude: nil)
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { spa: spa })
    end
    if @spas.empty?
      flash[:alert]= "No Spa found with this criteria"
      redirect_to root_path
    end
    @hash = Gmaps4rails.build_markers(@spas) do |spa, marker|
      marker.lat spa.latitude
      marker.lng spa.longitude
    end
    find_relative_distances(params['where'])
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

  def find_relative_distances(centre)
    location = Geocoder.coordinates(centre)
    @spas.each do |spa|
      spa.distance = Geocoder::Calculations.distance_between(location, [spa.latitude, spa.longitude])
    end
    #raise
  end
end
