# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :init_globals

  def index; end

  private

  def init_globals
    @encuentros = Encuentro.all
  end
end
