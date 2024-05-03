class CreateStudios < ActiveRecord::Migration[7.1]
  def change
    # Drop the existing table if it exists
    drop_table :studios, if_exists: true

    # Create a new table
    create_table :studios do |t|
      t.string "studio_name"
      # t.timestamps
    end
  end
end
