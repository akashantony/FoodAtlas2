class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.integer :longitude
      t.integer :latitude
      t.integer :creator_id
      t.timestamps
    end
  end
end
