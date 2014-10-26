class Team < ActiveRecord::Base
  attr_accessible :founding_year,
    :home_stadium,
    :logo,
    :name,
    :stadium_capacity,
    :website,
    :uuid,
    :players_attributes

  validates_uniqueness_of :name
  has_many :players
  accepts_nested_attributes_for :players

  def self.get_players(team_ids = [])
    all_players = []
    team_ids.map do |id|
      team_players = Team.find(id).players.each do |player|
        playher_hash  = {id: player.id, name: "#{player.first_name}" + " " +  "#{player.last_name}", position: player.position, team: player.team_name}
        all_players << playher_hash
      end
      all_players
    end
  end
end

# == Schema Information
#
# Table name: teams
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  logo             :string(255)
#  website          :string(255)
#  home_stadium     :string(255)
#  stadium_capacity :string(255)
#  founding_year    :integer
#  uuid             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_teams_on_name  (name) UNIQUE
#  index_teams_on_uuid  (uuid) UNIQUE
#
