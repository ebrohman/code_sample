class CreateGamePerformances < ActiveRecord::Migration
  def change
    create_table :game_performances do |t|
      t.integer :goals
      t.integer :player_id
      t.integer :assists
      t.integer :yellow_cards
      t.integer :red_cards
      t.decimal :shots_per_game
      t.decimal :pass_success_percentage
      t.integer :aerial_duels_won

      t.timestamps
    end
  end
end
