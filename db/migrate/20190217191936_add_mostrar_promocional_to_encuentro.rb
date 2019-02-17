class AddMostrarPromocionalToEncuentro < ActiveRecord::Migration[5.2]
  def change
    add_column :encuentros, :mostrar_promocional, :boolean
  end
end
