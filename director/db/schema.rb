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

ActiveRecord::Schema.define(version: 20140929001953) do

  create_table "event_types", force: true do |t|
    t.string   "Type"
    t.integer  "Parent"
    t.string   "Image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "event_type_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "title"
    t.string   "short_review"
    t.text     "long_review"
    t.string   "web_site_url"
    t.float    "location_lat"
    t.float    "location_long"
    t.string   "address"
    t.integer  "spice"
    t.integer  "cost"
    t.integer  "recommender_id"
    t.string   "image_url"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id"
  add_index "events", ["recommender_id"], name: "index_events_on_recommender_id"

  create_table "recommendation_types", force: true do |t|
    t.string   "type"
    t.text     "descr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommenders", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
