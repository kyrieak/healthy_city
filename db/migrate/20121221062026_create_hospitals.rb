class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :provider_number
      t.string :name
      t.integer :location_id
      t.string :phone_number
      t.string :hospital_type
      t.string :hospital_ownership
      t.boolean :emergency_services

      t.timestamps
    end
  end
end
