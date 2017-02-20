class SpasController < ApplicationController
  before_action :set_spa, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @spas = Spa.all
  end

  def show

  end

  def new
    @spa = Spa.new
  end

  private

  def set_spa
    @spa = Spa.find(params[:id])
  end
end
