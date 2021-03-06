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

ActiveRecord::Schema.define(version: 20131016173903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beta_requests", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beta_requests", ["id"], name: "index_beta_requests_on_id", using: :btree

  create_table "speakers", force: true do |t|
    t.text     "name"
    t.text     "bio"
    t.text     "email"
    t.text     "image_url"
    t.text     "twitter_handle"
    t.text     "title"
    t.text     "company"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed",           default: false
    t.text     "abstract"
    t.string   "website"
    t.boolean  "training"
    t.text     "presentation_format"
    t.text     "comments"
    t.string   "presentation_title"
  end

  add_index "speakers", ["id"], name: "index_speakers_on_id", using: :btree
  add_index "speakers", ["twitter_handle"], name: "index_speakers_on_twitter_handle", using: :btree

  create_table "volunteers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
