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

ActiveRecord::Schema.define(version: 20160910100320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sessions", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_game_sessions_on_game_id", using: :btree
    t.index ["player_id"], name: "index_game_sessions_on_player_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.integer "grid_size"
  end

  create_table "hypha", force: :cascade do |t|
    t.integer "mycelium_id"
    t.index ["mycelium_id"], name: "index_hypha_on_mycelium_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.integer "mycelium_id"
    t.integer "game_id"
    t.string  "x_position"
    t.string  "y_position"
    t.index ["game_id"], name: "index_locations_on_game_id", using: :btree
    t.index ["mycelium_id"], name: "index_locations_on_mycelium_id", using: :btree
  end

  create_table "mycelia", force: :cascade do |t|
    t.integer "player_id"
    t.integer "mother_id"
    t.integer "carbon"
    t.integer "nitrates"
    t.integer "proteins"
    t.integer "sugars"
    t.index ["mother_id"], name: "index_mycelia_on_mother_id", using: :btree
    t.index ["player_id"], name: "index_mycelia_on_player_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "game_sessions", "games"
  add_foreign_key "game_sessions", "players"
  add_foreign_key "hypha", "mycelia"
  add_foreign_key "locations", "games"
  add_foreign_key "mycelia", "players"
end
