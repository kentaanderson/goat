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

ActiveRecord::Schema.define(version: 20160115213851) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "event_attendees", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "map_url"
    t.string   "description"
    t.string   "comments"
    t.string   "summary"
    t.integer  "event_type_id"
    t.string   "event_type_other"
    t.integer  "sharing_status"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "start_date"
    t.date     "return_date"
  end

  create_table "gears", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "weight_oz"
    t.decimal  "weight_grams"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "icon"
    t.integer  "category_id"
    t.string   "manufacturer"
    t.integer  "user_id"
    t.string   "year_acquired"
  end

  create_table "imports", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "gear_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pack_items", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name"
    t.string   "description"
    t.string   "post_summary"
    t.integer  "category_id"
    t.string   "highlight"
    t.decimal  "weight_oz"
    t.integer  "weight_grams"
    t.string   "manufacturer"
    t.integer  "item_count"
    t.integer  "event_id"
    t.string   "icon"
    t.integer  "user_id"
    t.integer  "gear_id"
    t.integer  "wearing",       default: 0, null: false
    t.integer  "delivery",      default: 0, null: false
    t.integer  "inventory",     default: 0, null: false
    t.string   "year_acquired"
    t.integer  "pack_id"
  end

  create_table "packs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gear_id"
    t.integer  "event_id"
    t.string   "name"
    t.string   "summary"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "target_weight"
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "views", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true

  create_table "wishlists", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "description"
    t.decimal  "weight_oz"
    t.integer  "weight_grams"
    t.string   "icon"
    t.integer  "category_id"
    t.string   "manufacturer"
    t.integer  "user_id"
    t.string   "link"
  end

end
