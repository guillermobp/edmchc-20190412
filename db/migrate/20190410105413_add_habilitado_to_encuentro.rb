class AddHabilitadoToEncuentro < ActiveRecord::Migration[5.2]
  def change
    add_column :encuentros, :habilitado, :boolean, null: false, default: false
  end
end
