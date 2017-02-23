class Admin::SpasController < ApplicationController
  before_action :set_spa, only: [:edit, :update]
  def index
    @spas = current_user.spas
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
    params.require(:spa).permit(:name, :description)
  end

end
