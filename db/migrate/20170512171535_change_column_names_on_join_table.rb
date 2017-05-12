class ChangeColumnNamesOnJoinTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :brands_stores, :shoe_brand_id, :brand_id

    rename_column :brands_stores, :shoe_store_id, :store_id

  end
end
