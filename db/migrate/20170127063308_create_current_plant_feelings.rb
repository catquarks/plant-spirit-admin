class CreateCurrentPlantFeelings < ActiveRecord::Migration[5.0]
  def change
    create_table :current_plant_feelings do |t|
      t.integer :current_feeling_id
      t.integer :easing_plant_id

      t.timestamps
    end
  end
end
