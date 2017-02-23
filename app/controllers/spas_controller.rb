class SpasController < ApplicationController
  before_action :set_spa, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  skip_before_action :require_admin!

  def index
    if params['where'].nil? || params['where'].empty?
      @spas = Spa.all
    else
      limit = 100 if params['dist'].nil? || params['dist'].empty?
      @spas = Spa.near(params['where'], limit)
      # @spas = Spa.where(" lower(address) LIKE ?", "%#{params['where'].downcase}%")
    end
    if @spas.empty?
      flash[:alert]= "No Spa found with this criteria"
      redirect_to root_path #spas_path
    end
    @hash = Gmaps4rails.build_markers(@spas) do |spa, marker|
      marker.lat spa.latitude
      marker.lng spa.longitude
      marker.infowindow render_to_string(partial: "/shared/map_box", locals: { spa: spa })
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
    if location
      @spas.each do |spa|
        spa.distance = Geocoder::Calculations.distance_between(location, [spa.latitude, spa.longitude]).truncate
      end
    end
  end
end
