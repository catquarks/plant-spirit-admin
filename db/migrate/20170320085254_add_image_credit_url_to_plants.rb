class AddImageCreditUrlToPlants < ActiveRecord::Migration[5.0]
  def change
    add_column :plants, :image_credit_url, :string
  end
end
