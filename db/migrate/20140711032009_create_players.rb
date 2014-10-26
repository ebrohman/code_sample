class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :nationality
      t.integer :age
      t.datetime :birth_day
      t.string :birth_country
      t.string :birth_city
      t.string :position
      t.string :foot
      t.string :image
      t.integer :height_cm
      t.integer :weight_kg
      t.string :uuid
      t.string :team_uuid
      t.integer :team_id

      t.timestamps
    end

    add_index :players, :uuid, unique: true
    add_index :players, :team_uuid
    add_index :players, :team_id
  end
end
