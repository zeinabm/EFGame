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

ActiveRecord::Schema.define(version: 20150529214950) do

  create_table "Games_Users", id: false, force: true do |t|
    t.integer "game_id", null: false
    t.integer "user_id", null: false
  end

  create_table "chats", force: true do |t|
    t.integer  "game_id"
    t.integer  "sender_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_boards", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "Name"
    t.text     "LastName"
    t.text     "City"
    t.text     "Country"
    t.text     "food"
    t.text     "animal"
    t.text     "object"
    t.integer  "score",            default: 0
    t.integer  "judge_id"
    t.boolean  "has_been_judged?", default: false
  end

  create_table "games", force: true do |t|
    t.integer  "creater_id"
    t.integer  "number_of_rounds"
    t.integer  "number_of_players"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "done"
    t.boolean  "went_for_judgement", default: false
    t.boolean  "is_private"
  end

  create_table "items", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_letters", force: true do |t|
    t.integer  "game_id"
    t.string   "letter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round_number"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key"

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.integer  "birth_day"
    t.integer  "birth_month"
    t.integer  "birth_year"
    t.string   "name"
    t.string   "lastname"
    t.integer  "score",                  default: 0
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
