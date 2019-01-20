class AddTituloToConcierto < ActiveRecord::Migration[5.2]
  def change
    add_column :conciertos, :titulo, :string
  end
end
