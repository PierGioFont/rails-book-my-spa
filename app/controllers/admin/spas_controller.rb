class Admin::SpasController < ApplicationController
  def index
    # Let's anticipate on next week (with login)
    @spas = current_user.spas


  end
end
