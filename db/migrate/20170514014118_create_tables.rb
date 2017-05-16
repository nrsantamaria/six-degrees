class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:movies) do |t|
      t.column(:title, :text)
      t.column(:year, :integer)

      t.timestamps
    end
    create_table(:actors) do |t|
      t.column(:name, :text)
      t.column(:last_name, :text)
      t.column(:imdb_link, :text)

      t.timestamps
    end
    create_table(:actors_movies) do |t|
      t.column(:actor_id, :integer)
      t.column(:movie_id, :integer)

      t.timestamps
    end
  end
end
