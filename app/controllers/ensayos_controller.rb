class EnsayosController < AdminController
  before_action :find_ensayo, except: %i[index new]
  before_action :find_encuentro, only: %i[index new create]

    def index; end

    def new
      @ensayo = @encuentro.ensayos.build
    end

    def create
        @ensayo = Ensayo.new(ensayo_params)
        @ensayo.encuentro = Encuentro.last
        if (@ensayo.save)
            flash[:notice] = 'El ensayo ha sido creado exitosamente'
            redirect_to @ensayo
        else
            flash[:alert] = 'Ocurrió un error intentando crear el ensayo'
            redirect_to new_ensayo_path
        end
    end

    def show; end

    def edit; end

    def update
        if @ensayo.update(ensayo_params)
            flash[:notice] = 'El ensayo ha sido actualizado correctamente'
            redirect_to @ensayo
        else
            flash[:alert] = 'Ocurrió un error intentando actualizar el ensayo'
            redirect_to edit_ensayo_path(@ensayo)
        end
    end

    private

        def ensayo_params
            params.require(:ensayo).permit(:titulo, :descripcion, fotos: [])
        end

        def find_encuentro
          @encuentro = Encuentro.find(params[:encuentro_id])
        end

        def find_ensayo
          @ensayo = Ensayo.find(params[:id])
        end
end
