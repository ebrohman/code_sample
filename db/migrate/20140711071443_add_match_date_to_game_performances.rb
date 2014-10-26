class AddMatchDateToGamePerformances < ActiveRecord::Migration
  def change
    add_column :game_performances, :match_date, :date
  end
end
