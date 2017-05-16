class ActorsTableNamechange < ActiveRecord::Migration[5.1]
  def change
    remove_column(:actors, :last_name, :text)
    rename_column(:actors, :first_name, :name)
  end
end
