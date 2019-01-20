class AddCompositorToConcierto < ActiveRecord::Migration[5.2]
  def change
    add_column :conciertos, :compositor, :string
  end
end
