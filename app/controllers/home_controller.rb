class HomeController < ApplicationController
  def index
    @encuentro = Encuentro.where(habilitado: true).last
  end
end
