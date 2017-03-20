class AddImageCreditDescToPlants < ActiveRecord::Migration[5.0]
  def change
  	add_column :plants, :image_credit_desc, :text
  end
end
