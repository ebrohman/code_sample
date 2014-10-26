class Player < ActiveRecord::Base
  attr_accessible :age,
    :birth_city,
    :birth_country,
    :birth_day,
    :first_name,
    :foot,
    :height_cm,
    :image,
    :last_name,
    :nationality,
    :nickname,
    :position,
    :team_id,
    :team_uuid,
    :uuid,
    :weight_kg,
    :players_attributes

  validates_uniqueness_of :uuid

  belongs_to :team
  has_many :game_performances

  delegate :name, to: :team, prefix: true, allow_nil: true

  def report
    File.write("#{Rails.root}/tmp/report.txt", '')
  end

  def performances
    return GamePerformance.where(:player_id => self.id)
  end

  def total_games
    GamePerformance.all.count
  end

  def average_goals
    average_goals = 0.0
    performances.each do |game|
      average_goals += game.goals
    end
    average_goals = average_goals / total_games
  end

  def average_assists
    average_assists = 0.0
    performances.each do |game|
      average_assists += game.assists
    end
    average_assists = average_assists / total_games
  end

  def average_yellow_cards
    average_yellowcards = 0.0
    performances.each do |game|
      average_yellowcards += game.yellow_cards
    end
    average_yellowcards = average_yellowcards / total_games
  end

  def average_red_cards
    average_redcards = 0.0
    performances.each do |game|
      average_redcards += game.red_cards
    end
    average_redcards = average_redcards / total_games
  end

  def average_shots_per_game
    shots_per_game = 0.0
    performances.each do |game|
      shots_per_game += game.shots_per_game
    end
    average_shots_per_game = shots_per_game / performances.count
  end

  def average_pass_success_percentage
    total_success = 0.0
    performances.each do |game|
      total_success += game.pass_success_percentage
    end
    average_pass_success_percentage = (total_success / performances.count).round(2)
  end

  def average_aerial_duels_won
    aerial = 0.0
    performances.each do |game|
      aerial += game.aerial_duels_won
    end
    average_ariel_duels_won = aerial / performances.count
  end


end
# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  nickname      :string(255)
#  nationality   :string(255)
#  age           :integer
#  birth_day     :datetime
#  birth_country :string(255)
#  birth_city    :string(255)
#  position      :string(255)
#  foot          :string(255)
#  image         :string(255)
#  height_cm     :integer
#  weight_kg     :integer
#  uuid          :string(255)
#  team_uuid     :string(255)
#  team_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_players_on_team_id    (team_id)
#  index_players_on_team_uuid  (team_uuid)
#  index_players_on_uuid       (uuid) UNIQUE
#

# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  nickname      :string(255)
#  nationality   :string(255)
#  age           :integer
#  birth_day     :datetime
#  birth_country :string(255)
#  birth_city    :string(255)
#  position      :string(255)
#  foot          :string(255)
#  image         :string(255)
#  height_cm     :integer
#  weight_kg     :integer
#  uuid          :string(255)
#  team_uuid     :string(255)
#  team_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_players_on_team_id    (team_id)
#  index_players_on_team_uuid  (team_uuid)
#  index_players_on_uuid       (uuid) UNIQUE
#
