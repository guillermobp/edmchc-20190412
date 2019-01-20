class AddVideosToConcierto < ActiveRecord::Migration[5.2]
  def change
    add_column :conciertos, :videos, :text
  end
end
