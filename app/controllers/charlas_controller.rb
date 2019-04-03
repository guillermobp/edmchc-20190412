# frozen_string_literal: true

class CharlasController < AdminController
  before_action :find_charla, except: %i[index new create]
  before_action :find_encuentro, only: %i[index new create]

  def index; end

  def show; end

  def edit; end

  def new
    @charla = @encuentro.charlas.build
  end

  def create
    @charla = @encuentro.charlas.build(charla_params)
    if @charla.save
      flash[:notice] = 'La charla ha sido creada exitosamente'
      redirect_to encuentro_charlas_path(@charla.encuentro)
    else
      flash[:alert] = 'Ocurrió un error intentando crear la charla'
      redirect_to new_encuentro_charla_path(@encuentro)
    end
  end

  def update
    if @charla.update(charla_params)
      flash[:notice] = 'La charla ha sido actualizada correctamente'
      redirect_to encuentro_charlas_path(@charla.encuentro)
    else
      flash[:alert] = 'Ocurrió un error intentando actualizar la charla'
      redirect_to edit_charla_path(@charla)
    end
  end

  def destroy; end

  def fotos
    @fotos = Charla.find(params[:id]).fotos
    render layout: 'home'
  end

  private

  def charla_params
    params.require(:charla).permit(:titulo, fotos: [])
  end

  def find_encuentro
    @encuentro = @encuentro_tabs = Encuentro.find(params[:encuentro_id])
  end

  def find_charla
    @charla = Charla.find(params[:id])
    @encuentro_tabs = @charla.encuentro
  end
end
