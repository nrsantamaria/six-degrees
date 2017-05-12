class UpdatePriceColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :decimal)

    add_column(:brands, :price, :integer, :precision => 8, :scale => 2)
  end
end
