class CreateActors < ActiveRecord::Migration[7.1]
  def change
    # Drop the existing table if it exists
    drop_table :actors, if_exists: true

    # Create a new table
    create_table :actors do |t|
      t.string "actor_name"
      # t.timestamps
    end
  end
end
