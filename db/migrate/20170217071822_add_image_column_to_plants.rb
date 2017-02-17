class AddImageColumnToPlants < ActiveRecord::Migration[5.0]
  def up
  	add_attachment :plants, :image
  end

  def down
  	remove_attachment :plants, :image 
  end
end
