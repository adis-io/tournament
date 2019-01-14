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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_08_035133) do

  create_table "games", force: :cascade do |t|
    t.integer "first_team_id"
    t.integer "second_team_id"
    t.integer "winner_id"
    t.string "stage"
    t.integer "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_team_id", "second_team_id", "stage"], name: "index_games_on_first_team_id_and_second_team_id_and_stage", unique: true
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "tournament_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_groups_on_team_id"
    t.index ["tournament_id"], name: "index_groups_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "tournament_id"
    t.integer "wins", default: 0
    t.string "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
