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

ActiveRecord::Schema.define(version: 20141107193123) do

  create_table "event_type_answer_weights", force: true do |t|
    t.integer  "potential_answer_id", null: false
    t.integer  "event_type_id",       null: false
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_type_answer_weights", ["event_type_id"], name: "index_event_type_answer_weights_on_event_type_id"
  add_index "event_type_answer_weights", ["potential_answer_id"], name: "index_event_type_answer_weights_on_potential_answer_id"

  create_table "event_types", force: true do |t|
    t.string   "event_type_name", null: false
    t.integer  "parent"
    t.string   "image",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "event_type_id",                  null: false
    t.datetime "start_time",                     null: false
    t.datetime "end_time",                       null: false
    t.string   "title",                          null: false
    t.string   "short_review"
    t.text     "long_review"
    t.string   "web_site_url"
    t.float    "location_lat",                   null: false
    t.float    "location_long",                  null: false
    t.string   "address"
    t.integer  "spice",                          null: false
    t.integer  "cost",                           null: false
    t.integer  "recommender_id"
    t.string   "image"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "general_hours",  default: false
  end

  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id"
  add_index "events", ["recommender_id"], name: "index_events_on_recommender_id"

  create_table "open_hours", force: true do |t|
    t.integer  "event_id",                  null: false
    t.string   "day_of_the_week",           null: false
    t.string   "open_hour",       limit: 5, null: false
    t.string   "close_hour",      limit: 5, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_hours", ["event_id"], name: "index_open_hours_on_event_id"

  create_table "potential_answers", force: true do |t|
    t.integer  "question_id", null: false
    t.text     "answer",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "potential_answers", ["question_id"], name: "index_potential_answers_on_question_id"

  create_table "questions", force: true do |t|
    t.text     "question",      null: false
    t.string   "question_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendation_types", force: true do |t|
    t.string   "rec_type",   null: false
    t.text     "descr",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommenders", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.text     "descr",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_answers", force: true do |t|
    t.integer  "user_id",             null: false
    t.integer  "potential_answer_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_answers", ["potential_answer_id"], name: "index_user_answers_on_potential_answer_id"
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
