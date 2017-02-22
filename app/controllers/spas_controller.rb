class SpasController < ApplicationController
  before_action :set_spa, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params['where'].nil? || params['where'].empty?
      @spas = Spa.all
    # elsif params['dist'].nil?
    #   @spas = Spa.where("lower(address) LIKE ? ", "%#{params['where'].downcase}%")
    else
      # distance = 100 if params['dist'].nil? || params['dist'].empty?
      distance = 101
      @spas = Spa.near(params['where'], distance)
      # @flats = Flat.where.not(latitude: nil, longitude: nil)
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { spa: spa })
      if @spas.empty?
        flash[:alert]= "No Spa found with this criteria"
        redirect_to root_path
      end
    end
    @hash = Gmaps4rails.build_markers(@spas) do |spa, marker|
      marker.lat spa.latitude
      marker.lng spa.longitude
    end
    # find_relative_distances(params['where'])
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
      distance = Geocoder::Calculations.distance_between(location, [spa.latitude, spa.longitude])
      spa.distance = distance

      # spa.distance = distance.truncate unless distance.nil?
    end
    #raise
  end
end
