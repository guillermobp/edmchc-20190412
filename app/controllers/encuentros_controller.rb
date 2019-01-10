class EncuentrosController < ApplicationController

    def index
        @encuentros = Encuentro.all
    end

    def new
      @encuentro = Encuentro.new
    end

    def edit
        @encuentro = Encuentro.find(params[:id])
    end

    def show
        @encuentro = Encuentro.find(params[:id])
    end

    def create
      @encuentro = Encuentro.new(encuentro_params)
      if @encuentro.save
        flash[:notice] = 'El encuentro ha sido creado exitosamente'
        redirect_to @encuentro
      else
        flash[:alert] = 'Ha ocurrido un error intentando crear el encuentro'
        redirect_to edit_encuentro_path(@encuentro)
      end
    end

    def update
        @encuentro = Encuentro.find(params[:id])

        if @encuentro.update(encuentro_params)
            flash[:notice] = 'El encuentro ha sido actualizado exitosamente'
            redirect_to @encuentro
        else
            flash[:alert] = 'Ocurrió un error intentando actualizar el encuentro'
            redirect_to edit_encuentro_path(@encuentro)
        end
    end

    def destroy
      @encuentro = Encuentro.find(params[:id])

      @encuentro.video.purge
      @encuentro.logos.purge
      @encuentro.fotos.purge
      @encuentro.foto_quienes_somos.purge
      @encuentro.foto_coordinador.purge

      @encuentro.charlas.each do |c|
        c.fotos.purge
      end

      @encuentro.exponentes.each do |e|
        e.foto.purge
      end

      @encuentro.ensayos.each do |e|
        e.fotos.purge
      end

      @encuentro.conciertos.each do |c|
        c.fotos.purge
      end

      if @encuentro.destroy
          flash[:notice] = 'El encuentro ha sido eliminado exitosamente'
          redirect_to encuentros_path
      else
          flash[:alert] = 'Ocurrió un error intentando eliminar el encuentro'
          redirect_to encuentros_path
      end
    end

    private

        def encuentro_params
            params.require(:encuentro).permit(:epigrafe, :titulo, :bajada, :video, :titulo_quienes_somos, :cuerpo_quienes_somos, :foto_quienes_somos, :foto_coordinador, :videos, fotos: [], fotos_ensayos: [], logos: [])
        end

end
