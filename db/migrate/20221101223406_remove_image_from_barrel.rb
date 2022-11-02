class RemoveImageFromBarrel < ActiveRecord::Migration[7.0]
  def change
    remove_column :barrels, :image, :string
  end
end
