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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150422200517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "song_tag", force: :cascade do |t|
    t.integer "song_id"
    t.integer "tag_id"
  end

  add_index "song_tag", ["song_id"], name: "index_song_tag_on_song_id", using: :btree
  add_index "song_tag", ["tag_id"], name: "index_song_tag_on_tag_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.text     "title"
    t.text     "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "label"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  add_foreign_key "song_tag", "songs"
  add_foreign_key "song_tag", "tags"
  add_foreign_key "songs", "users"
end
