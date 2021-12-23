# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_23_020607) do

  create_table "companies", force: :cascade do |t|
    t.integer "ird_no"
    t.string "name"
    t.string "address"
    t.string "entity_type"
    t.string "activity_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "paye_no"
  end

  create_table "taxpayer_years", force: :cascade do |t|
    t.integer "taxpayer_id"
    t.integer "year_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taxpayers", force: :cascade do |t|
    t.string "ird_no"
    t.string "old_ird_no"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "address"
    t.string "entity_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity_status"
    t.integer "company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "access_level"
  end

  create_table "years", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
