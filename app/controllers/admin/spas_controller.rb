class Admin::SpasController < ApplicationController
  def index
    @spas = current_user.spas
  end
end
