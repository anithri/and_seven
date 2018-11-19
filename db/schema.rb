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

ActiveRecord::Schema.define(version: 2018_11_05_030505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "custom_awards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "category", default: 0
    t.uuid "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_custom_awards_on_employee_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "mobile"
    t.integer "gust_id"
    t.integer "pc3_id"
    t.string "remember_digest"
    t.boolean "is_gone", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["name"], name: "index_employees_on_name", unique: true
    t.index ["remember_digest"], name: "index_employees_on_remember_digest", unique: true
    t.index ["username"], name: "index_employees_on_username", unique: true
  end

  create_table "employees_user_groups", id: false, force: :cascade do |t|
    t.uuid "employee_id", null: false
    t.uuid "user_group_id", null: false
  end

  create_table "user_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "access", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_groups_on_name", unique: true
  end

  add_foreign_key "custom_awards", "employees"
end
