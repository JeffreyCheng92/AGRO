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

ActiveRecord::Schema.define(version: 20150817190236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consoles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_consoles", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "console_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_consoles", ["console_id"], name: "index_game_consoles_on_console_id", using: :btree
  add_index "game_consoles", ["game_id", "console_id"], name: "index_game_consoles_on_game_id_and_console_id", unique: true, using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "title",        null: false
    t.integer  "author_id",    null: false
    t.text     "description",  null: false
    t.string   "developer",    null: false
    t.string   "release_date", null: false
    t.string   "rating",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "games", ["author_id"], name: "index_games_on_author_id", using: :btree
  add_index "games", ["title"], name: "index_games_on_title", unique: true, using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "url",            null: false
    t.string   "thumbnail_url",  null: false
    t.integer  "imageable_id",   null: false
    t.string   "imageable_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.integer  "game_id",    null: false
    t.text     "body",       null: false
    t.float    "rating",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["author_id", "game_id"], name: "index_reviews_on_author_id_and_game_id", unique: true, using: :btree
  add_index "reviews", ["game_id"], name: "index_reviews_on_game_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",     null: false
    t.integer  "game_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["game_id", "tag_id"], name: "index_taggings_on_game_id_and_tag_id", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "label",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["label"], name: "index_tags_on_label", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "session_token",   null: false
    t.string   "password_digest", null: false
    t.text     "bio"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
