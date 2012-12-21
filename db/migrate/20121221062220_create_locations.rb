class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :county

      t.timestamps
    end
  end
end
