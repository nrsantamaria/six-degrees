class ChangePriceColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :money)

    add_column(:brands, :price, :decimal, :precision => 8, :scale => 2)

  end
end
