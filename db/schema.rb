# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140711071443) do

  create_table "game_performances", :force => true do |t|
    t.integer  "goals"
    t.integer  "player_id"
    t.integer  "assists"
    t.integer  "yellow_cards"
    t.integer  "red_cards"
    t.decimal  "shots_per_game"
    t.decimal  "pass_success_percentage"
    t.integer  "aerial_duels_won"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.date     "match_date"
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "nationality"
    t.integer  "age"
    t.datetime "birth_day"
    t.string   "birth_country"
    t.string   "birth_city"
    t.string   "position"
    t.string   "foot"
    t.string   "image"
    t.integer  "height_cm"
    t.integer  "weight_kg"
    t.string   "uuid"
    t.string   "team_uuid"
    t.integer  "team_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "players", ["team_id"], :name => "index_players_on_team_id"
  add_index "players", ["team_uuid"], :name => "index_players_on_team_uuid"
  add_index "players", ["uuid"], :name => "index_players_on_uuid", :unique => true

  create_table "sponsor_companies", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "net_worth"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "website"
    t.string   "home_stadium"
    t.string   "stadium_capacity"
    t.integer  "founding_year"
    t.string   "uuid"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "teams", ["name"], :name => "index_teams_on_name", :unique => true
  add_index "teams", ["uuid"], :name => "index_teams_on_uuid", :unique => true

end
