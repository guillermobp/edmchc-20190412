class AddVideosToEncuentro < ActiveRecord::Migration[5.2]
  def change
    add_column :encuentros, :videos, :text
  end
end
