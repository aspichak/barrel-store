class CreateBarrels < ActiveRecord::Migration[7.0]
  def change
    create_table :barrels do |t|
      t.string :name
      t.string :image
      t.text :description
      t.float :volume
      t.decimal :price, precision: 8, scale: 2
      
      t.timestamps
    end
  end
end
