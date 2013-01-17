class CreateCapacities < ActiveRecord::Migration
  def change
    create_table :capacities do |t|
      t.integer :hospital_id
      t.integer :bed_count
      t.integer :full_time_nurse_count
      t.boolean :teaching_hospital
      t.string :source

      t.timestamps
    end
  end
end
