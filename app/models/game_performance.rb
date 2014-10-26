class GamePerformance < ActiveRecord::Base
  attr_accessible :aerial_duels_won,
    :assists,
    :goals,
    :pass_success_percentage,
    :player_id,
    :red_cards,
    :shots_per_game,
    :yellow_cards,
    :match_date

  belongs_to :player

  def self.all_games
    GamePerformance.all
  end

  def self.median_goals
    goals = 0.0
    all_games.each do |game|
      goals += game.goals
    end
    median_goals = goals / all_games.count
  end

  def self.sum_goals
    goals = 0.0
    all_games.each do |game|
      goals += game.goals
    end
    goals
  end

  def self.median_assists
    assists = 0.0
    all_games.each do |game|
      assists += game.assists
    end
    median_assists = assists / all_games.count
  end

  def self.sum_assists
    assists = 0.0
    all_games.each do |game|
      assists += game.assists
    end
    assists
  end

  def self.median_yellow_cards
    cards = 0.0
    all_games.each do |game|
      cards += game.yellow_cards
    end
    median_yellow_cards = cards / all_games.count
  end

  def self.sum_yellow_cards
    cards = 0.0
    all_games.each do |game|
      cards += game.yellow_cards
    end
    cards
  end

  def self.median_red_cards
    cards = 0.0
    all_games.each do |game|
      cards += game.red_cards
    end
    median_red_cards = cards / all_games.count
  end

  def self.sum_red_cards
    cards = 0.0
    all_games.each do |game|
      cards += game.red_cards
    end
    cards
  end

  def self.median_shots_per_game
    shots = 0.0
    all_games.each do |game|
      shots += game.shots_per_game
    end
    median_shots_per_game = shots / all_games.count
  end

  def self.sum_shots_per_game
    shots = 0.0
    all_games.each do |game|
      shots += game.shots_per_game
    end
    shots
  end

  def self.median_pass_success_percentage
    pass = 0.0
    all_games.each do |game|
      pass += game.pass_success_percentage
    end
    median_pass_success_percentage = (pass / all_games.count).round(2)
  end

  def self.sum_pass_success_percentage
    pass = 0.0
    all_games.each do |game|
      pass += game.pass_success_percentage
    end
    pass.round(2)
  end

  def self.median_aerial_duels_won
    duels = 0.0
    all_games.each do |game|
      duels += game.aerial_duels_won
    end
    median_aerial_duels_won = duels / all_games.count
  end

  def self.sum_aerial_duels_won
    duels = 0.0
    all_games.each do |game|
      duels += game.aerial_duels_won
    end
    duels
  end

  def self.scrape_data
    page = Nokogiri::HTML(open("public/data/stats.html"))
    array = []
    #grabbing td content and putting it in array
    page.css("td").each do |td|
      array << td.text()
    end
    #slice array to fit each record including show, edit and delete buttons
    new_array = array.each_slice(12).to_a

    CSV.open("table.csv", "w") do |csv|
      new_array.each do |chunk|
        csv << chunk[0...9]
      end
    end

    csv_text = File.read('table.csv')
    csv = CSV.parse(csv_text)
    csv.each do |row|
      GamePerformance.create!(match_date: row[0], goals: row[1], player_id: row[2], assists: row[3], yellow_cards: row[4], red_cards: row[5], shots_per_game: row[6], pass_success_percentage: row[7], aerial_duels_won: row[8] )
    end
  end

end



# == Schema Information
#
# Table name: game_performances
#
#  id                      :integer          not null, primary key
#  goals                   :integer
#  player_id               :integer
#  assists                 :integer
#  yellow_cards            :integer
#  red_cards               :integer
#  shots_per_game          :decimal(, )
#  pass_success_percentage :decimal(, )
#  aerial_duels_won        :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  match_date              :date
#
