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

ActiveRecord::Schema.define(version: 20160911163425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "grid_size"
  end

  create_table "hyphae", force: :cascade do |t|
    t.integer "mycelium_id"
    t.index ["mycelium_id"], name: "index_hyphae_on_mycelium_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.integer "mycelium_id"
    t.integer "game_id"
    t.string  "x_position"
    t.string  "y_position"
    t.index ["game_id"], name: "index_locations_on_game_id", using: :btree
    t.index ["mycelium_id"], name: "index_locations_on_mycelium_id", using: :btree
  end

  create_table "mushrooms", force: :cascade do |t|
    t.integer "mycelium_id"
    t.index ["mycelium_id"], name: "index_mushrooms_on_mycelium_id", using: :btree
  end

  create_table "mycelia", force: :cascade do |t|
    t.integer "player_id"
    t.integer "mother_id"
    t.integer "carbon",    default: 100
    t.integer "nitrates",  default: 100
    t.integer "proteins",  default: 100
    t.integer "sugars",    default: 50
    t.index ["mother_id"], name: "index_mycelia_on_mother_id", using: :btree
    t.index ["player_id"], name: "index_mycelia_on_player_id", using: :btree
  end

  create_table "player_sessions", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_player_sessions_on_game_id", using: :btree
    t.index ["player_id"], name: "index_player_sessions_on_player_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
  end

  create_table "spores", force: :cascade do |t|
    t.integer "mushroom_id"
    t.index ["mushroom_id"], name: "index_spores_on_mushroom_id", using: :btree
  end

  add_foreign_key "hyphae", "mycelia"
  add_foreign_key "locations", "games"
  add_foreign_key "mushrooms", "mycelia"
  add_foreign_key "mycelia", "players"
  add_foreign_key "player_sessions", "games"
  add_foreign_key "player_sessions", "players"
  add_foreign_key "spores", "mushrooms"
end
