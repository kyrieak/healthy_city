class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :filename

      t.timestamps
    end
  end
end
