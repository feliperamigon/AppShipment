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

ActiveRecord::Schema.define(version: 20160723171016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "containers", force: :cascade do |t|
    t.string   "title"
    t.string   "origin"
    t.string   "destiny"
    t.string   "shipping_day"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "containers", ["user_id"], name: "index_containers_on_user_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "title"
    t.string   "dimension"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "container_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "packages", ["container_id"], name: "index_packages_on_container_id", using: :btree
  add_index "packages", ["user_id"], name: "index_packages_on_user_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "container_id"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "shipments", ["container_id"], name: "index_shipments_on_container_id", using: :btree
  add_index "shipments", ["package_id"], name: "index_shipments_on_package_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "country",                default: ""
    t.string   "state",                  default: ""
    t.string   "city",                   default: ""
    t.integer  "cellphone"
    t.integer  "telephone"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "containers", "users"
  add_foreign_key "packages", "containers"
  add_foreign_key "packages", "users"
  add_foreign_key "shipments", "containers"
  add_foreign_key "shipments", "packages"
end
