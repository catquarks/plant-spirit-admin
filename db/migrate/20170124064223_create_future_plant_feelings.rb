class CreateFuturePlantFeelings < ActiveRecord::Migration[5.0]
  def change
    create_table :future_plant_feelings do |t|
      t.integer :future_feeling_id
      t.integer :encouraging_plant_id

      t.timestamps
    end
  end
end
