class RemoveImageColumnFromPlants < ActiveRecord::Migration[5.0]
  def change
  	remove_column :plants, :image
  end
end
