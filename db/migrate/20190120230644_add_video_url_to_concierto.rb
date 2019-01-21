class AddVideoUrlToConcierto < ActiveRecord::Migration[5.2]
  def change
    add_column :conciertos, :video_url, :string
  end
end
