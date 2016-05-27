class MigrateSchema < ActiveRecord::Migration[5.0]
  def change
		create_table "artists", force: :cascade do |t|
			t.string   "name"
			t.text     "bio"
			t.datetime "created_at", null: false
			t.datetime "updated_at", null: false
		end

		create_table "event_artists", force: :cascade do |t|
			t.integer "artist_id"
			t.integer "event_id"
		end

		add_index "event_artists", ["artist_id"], name: "index_event_artists_on_artist_id", using: :btree
		add_index "event_artists", ["event_id"], name: "index_event_artists_on_event_id", using: :btree

		create_table "events", force: :cascade do |t|
			t.string   "name"
			t.datetime "date"
			t.text     "description"
			t.datetime "created_at",  null: false
			t.datetime "updated_at",  null: false
			t.integer  "venue_id"
		end

		add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

		create_table "venues", force: :cascade do |t|
			t.string   "name"
			t.string   "address"
			t.integer  "zip_code"
			t.datetime "created_at", null: false
			t.datetime "updated_at", null: false
		end

		add_foreign_key "events", "venues"

  end
end
