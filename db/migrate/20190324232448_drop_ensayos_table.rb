class DropEnsayosTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :ensayos
  end
end
