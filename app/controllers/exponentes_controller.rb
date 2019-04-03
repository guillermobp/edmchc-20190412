# frozen_string_literal: true

class ExponentesController < AdminController
  before_action :find_exponente, except: %i[index new create]
  before_action :find_encuentro, only: %i[index new create]

  def index; end

  def show; end

  def edit; end

  def new
    @exponente = @encuentro.exponentes.build
  end

  def create
    @exponente = @encuentro.exponentes.build(exponente_params)
    if @exponente.save
      flash[:notice] = 'El exponente ha sido creado exitosamente'
      redirect_to encuentro_exponentes_path(@encuentro)
    else
      flash[:alert] = 'Ocurrió un error intentando crear el exponente'
      redirect_to new_encuentro_exponente_path(@encuentro)
    end
  end

  def update
    if @exponente.update(exponente_params)
      flash[:notice] = 'El exponente ha sido actualizado exitosamente'
      redirect_to encuentro_exponentes_path(@exponente.encuentro)
    else
      flash[:alert] = 'Ocurrió un error intentando actualizar el exponente'
      redirect_to edit_exponente_path(@exponente)
    end
  end

  def destroy; end

  private

  def exponente_params
    params.require(:exponente).permit(:foto, :nombre, :bio)
  end

  def find_encuentro
    @encuentro = @encuentro_tabs = Encuentro.find(params[:encuentro_id])
  end

  def find_exponente
    @exponente = Exponente.find(params[:id])
    @encuentro_tabs = @exponente.encuentro
  end
end
