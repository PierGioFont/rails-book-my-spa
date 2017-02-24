class Admin::SpasController < ApplicationController
  before_action :set_spa, only: [:edit, :update]
  skip_before_action :require_admin!, only: [:new]

  def index
    @spas = current_user.spas
  end

  def new
    @spa = Spa.new
  end

  def create
    @spa = Spa.new(spa_params)
    @spa.user = current_user
    if @spa.save
      redirect_to spa_path(@spa), notice: 'Spa was successfully created.'
    else
      # @spa = Spa.find(params[:spa_id])
      # render 'spas/show'
      flash[:alert]= "Invalid spa please check the form"
      # redirect_to spa_path(params[:spa_id])
      render :new
    end
  end

  def edit

  end

  def update
    @spa.update(spa_params)

    if @spa.save
      redirect_to @spa, notice: 'Spa content was successfully updated.'
    else
      flash[:alert] = "Invalid content please check the form"
      render :edit
    end
  end

  private

  def set_spa
    @spa = Spa.find(params[:id])
  end

  def spa_params
    params.require(:spa).permit(:name, :description, :photo, :address)
  end

end
