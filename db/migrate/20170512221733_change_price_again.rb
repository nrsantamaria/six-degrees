class ChangePriceAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :integer)

    add_column(:brands, :price, :varchar)
  end
end
