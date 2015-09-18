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

ActiveRecord::Schema.define(version: 20150917011827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.string   "player"
    t.integer  "template_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "group_traits", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.boolean  "show_heading"
    t.integer  "dots_available"
    t.string   "input_type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "has_dots",            default: false
    t.boolean  "has_boxes",           default: false
    t.integer  "freebie_cost"
    t.integer  "experience_new_cost"
    t.integer  "experience_dot_cost"
    t.integer  "max_value"
  end

  create_table "list_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "selection_list_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "segment_groups", force: :cascade do |t|
    t.integer  "segment_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name"
    t.boolean  "has_priorities"
    t.boolean  "show_heading"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "dots_available"
  end

  create_table "selection_lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_segments", force: :cascade do |t|
    t.integer  "template_id"
    t.integer  "segment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "template_selection_lists", force: :cascade do |t|
    t.integer  "template_id"
    t.integer  "selection_list_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "privacy",    default: "public"
  end

  create_table "traits", force: :cascade do |t|
    t.string   "name"
    t.integer  "max_value"
    t.integer  "start_value"
    t.integer  "freebie_cost"
    t.integer  "experiance_dot_cost"
    t.integer  "experiance_new_cost"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
