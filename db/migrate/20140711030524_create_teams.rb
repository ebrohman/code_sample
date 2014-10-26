class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.string :website
      t.string :home_stadium
      t.string :stadium_capacity
      t.integer :founding_year
      t.string :uuid

      t.timestamps
    end

    add_index :teams, :name, unique: true
    add_index :teams, :uuid, unique: true
  end
end
