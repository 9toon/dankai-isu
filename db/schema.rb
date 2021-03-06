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

ActiveRecord::Schema.define(version: 20160527054425) do

  create_table "pvs", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "controller", limit: 255
    t.string   "action",     limit: 255
  end

  add_index "pvs", ["controller", "action"], name: "index_pvs_on_controller_and_action", using: :btree

  create_table "recipe_images", force: :cascade do |t|
    t.integer  "recipe_id",  limit: 4
    t.string   "path",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "recipe_images", ["recipe_id"], name: "index_recipe_images_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "view_count", limit: 4,   default: 0
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "recipe_id",   limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree

end
