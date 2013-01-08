class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.integer :activity_id
      t.date :date

      t.timestamps
    end
  end
end
