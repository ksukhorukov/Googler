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

ActiveRecord::Schema.define(version: 20151012085521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caches", force: :cascade do |t|
    t.integer  "statistic_id"
    t.string   "cache"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        null: false
    t.string   "description", null: false
    t.string   "keys",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "adw_top"
    t.integer "adw_right"
    t.integer "adw_total"
    t.string  "top_urls"
    t.string  "right_urls"
    t.integer "non_adw"
    t.string  "urls_non_adw"
    t.integer "links_total"
    t.string  "total_results"
    t.string  "word"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
