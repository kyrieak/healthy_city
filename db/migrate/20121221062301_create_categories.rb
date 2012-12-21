class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :has_footnote

      t.timestamps
    end
  end
end
