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

ActiveRecord::Schema.define(version: 20141006184548) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "event_type_answer_weights", force: true do |t|
    t.integer  "potential_answer_id"
    t.integer  "event_type_id"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_type_answer_weights", ["event_type_id"], name: "index_event_type_answer_weights_on_event_type_id"
  add_index "event_type_answer_weights", ["potential_answer_id"], name: "index_event_type_answer_weights_on_potential_answer_id"

  create_table "event_types", force: true do |t|
    t.string   "event_type_name"
    t.integer  "parent"
    t.string   "image"
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

  create_table "potential_answers", force: true do |t|
    t.integer  "question_id"
    t.text     "answer"
    t.integer  "answer_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "potential_answers", ["question_id"], name: "index_potential_answers_on_question_id"

  create_table "questions", force: true do |t|
    t.text     "question"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendation_types", force: true do |t|
    t.string   "rec_type"
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
