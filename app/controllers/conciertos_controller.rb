# frozen_string_literal: true

class ConciertosController < AdminController
  before_action :find_concierto, except: %i[index new create]
  before_action :find_encuentro, only: %i[index new create]

  def index; end

  def show; end

  def edit; end

  def new
    @concierto = @encuentro.conciertos.build
  end

  def create
    @concierto = @encuentro.conciertos.build(concierto_params)
    if @concierto.save
      flash[:notice] = 'El concierto ha sido creado exitosamente'
      redirect_to encuentro_conciertos_path(@encuentro)
    else
      flash[:alert] = 'Ha ocurrido un error intentando crear el concierto'
      redirect_to new_encuentro_concierto_path(@encuentro)
    end
  end

  def update
    if @concierto.update(concierto_params)
      flash[:notice] = 'El concierto ha sido actualizado exitosamente'
      redirect_to encuentro_conciertos_path(@concierto.encuentro)
    else
      flash[:alert] = 'Ha ocurrido un error intentando actualizar el concierto'
      redirect_to edit_concierto_path(@concierto)
    end
  end

  def destroy; end

  def fotos
    @fotos = Concierto.find(params[:id]).fotos
    render layout: 'home'
  end

  private

  def concierto_params
    params.require(:concierto).permit(:fecha, :hora, :lugar, :obras,
                                      :compositor, :titulo, :interpretes,
                                      :videos, :video_url, fotos: [])
  end

  def find_encuentro
    @encuentro = @encuentro_tabs = Encuentro.find(params[:encuentro_id])
  end

  def find_concierto
    @concierto = Concierto.find(params[:id])
    @encuentro_tabs = @concierto.encuentro
  end
end
