class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    # Drop the existing table if it exists
    drop_table :characters, if_exists: true

    # Create a new table
    create_table :characters do |t|
      #NOT NEED TO CREATE "id", it will be created automatically
      t.integer "actor_id"
      t.integer "movie_id"
      t.string "character_name"
      # t.timestamps
    end
  end
end
