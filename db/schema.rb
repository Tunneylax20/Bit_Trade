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

ActiveRecord::Schema.define(version: 20140402225432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.decimal  "usd",        default: 25000.0
    t.decimal  "btc"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.decimal  "price"
    t.decimal  "btc_total"
    t.decimal  "usd_total"
    t.integer  "buy"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "doge_total", default: 0.0
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "user_name"
    t.string   "password_digest"
    t.decimal  "usd",             default: 25000.0
    t.decimal  "btc",             default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "doge",            default: 0.0
  end

end
