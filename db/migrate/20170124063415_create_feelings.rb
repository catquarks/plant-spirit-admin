class CreateFeelings < ActiveRecord::Migration[5.0]
  def change
    create_table :feelings do |t|
      t.string :name
      t.string :summary
      t.string :image

      t.timestamps
    end
  end
end
