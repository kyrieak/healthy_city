class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.integer :activity_id
      t.date :date
      t.integer :week
      t.integer :year

      t.timestamps
    end
  end
end
