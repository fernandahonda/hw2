class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    # Drop the existing table if it exists
    drop_table :movies, if_exists: true

    # Create a new table
    create_table :movies do |t|
      t.string "title"
      t.integer "release_year"
      t.string "rating"
      t.integer "studio_id"
      # t.timestamps
    end
  end
end
