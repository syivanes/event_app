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

ActiveRecord::Schema.define(version: 20170108203435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "artist_pic"
  end

  create_table "event_artists", force: :cascade do |t|
    t.integer "event_id"
    t.integer "artist_id"
    t.index ["artist_id"], name: "index_event_artists_on_artist_id", using: :btree
    t.index ["event_id"], name: "index_event_artists_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "venue_id"
    t.index ["venue_id"], name: "index_events_on_venue_id", using: :btree
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "status"
    t.index ["event_id"], name: "index_rsvps_on_event_id", using: :btree
    t.index ["user_id"], name: "index_rsvps_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "username"
    t.boolean  "guest"
  end

  create_table "venue_suggestions", force: :cascade do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.float    "longitude"
    t.float    "latitude"
  end

  add_foreign_key "events", "venues"
end
