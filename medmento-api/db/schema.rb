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

ActiveRecord::Schema.define(version: 20141203054911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clockwork_events", force: true do |t|
    t.string   "patient_name"
    t.string   "drug_name"
    t.string   "message"
    t.string   "patient_number"
    t.integer  "frequency_quantity"
    t.integer  "frequency_period_id"
    t.string   "at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clockwork_events", ["frequency_period_id"], name: "index_clockwork_events_on_frequency_period_id", using: :btree

  create_table "frequency_periods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pain_ratings", force: true do |t|
    t.integer  "rating"
    t.integer  "clockwork_event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
