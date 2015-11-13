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

ActiveRecord::Schema.define(version: 20151113211354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.text     "title"
    t.integer  "user_id"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  add_index "cards", ["list_id"], name: "index_cards_on_list_id", using: :btree
  add_index "cards", ["user_id"], name: "index_cards_on_user_id", using: :btree

  create_table "cards_labels", id: false, force: :cascade do |t|
    t.integer "card_id"
    t.integer "label_id"
  end

  add_index "cards_labels", ["card_id"], name: "index_cards_labels_on_card_id", using: :btree
  add_index "cards_labels", ["label_id"], name: "index_cards_labels_on_label_id", using: :btree

  create_table "labels", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "color"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "labels", ["user_id"], name: "index_labels_on_user_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "is_admin"
    t.string   "avatar_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
