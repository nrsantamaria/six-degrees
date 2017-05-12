class ChangeTableNames < ActiveRecord::Migration[5.1]
  def change
    rename_table :shoe_stores, :stores

    rename_table :shoe_brands, :brands

    rename_table :shoe_brands_shoe_stores, :brands_stores
  end
end
