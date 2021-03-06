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

ActiveRecord::Schema.define(version: 2020_02_28_183034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "spot_tracks", force: :cascade do |t|
    t.string "playlist_href"
    t.string "playlist_id"
    t.string "playlist_name"
    t.date "track_saved"
    t.string "album"
    t.string "artist"
    t.integer "disc_number"
    t.string "duration_ms"
    t.string "track_href"
    t.string "spotify_track_id"
    t.string "preview_url"
    t.integer "track_number"
    t.string "spotify_uri"
    t.string "is_local"
    t.integer "star_rating"
    t.text "comment"
    t.date "album_date"
    t.string "sort_attribute1"
    t.string "sort_attribute2"
    t.string "sort_attribute3"
    t.string "sort_attribute4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
