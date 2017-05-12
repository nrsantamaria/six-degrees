class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe_stores) do |t|
      t.column(:name, :text)

      t.timestamps
    end
    create_table(:shoe_brands) do |t|
      t.column(:name, :text)
      t.column(:price, :money)

      t.timestamps
    end
    create_table(:shoe_brands_shoe_stores) do |t|
      t.column(:shoe_brand_id, :integer)
      t.column(:shoe_store_id, :integer)

      t.timestamps
    end
  end
end
