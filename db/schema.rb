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

ActiveRecord::Schema.define(version: 2018_08_11_100519) do

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.integer "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "staff_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salons", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "address"
    t.string "url"
    t.string "email"
    t.string "phone_number"
    t.integer "staff_id"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "salon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.date "birth", null: false
    t.integer "sex", null: false
    t.boolean "color", default: false, null: false
    t.boolean "hair_extension", default: false, null: false
    t.boolean "nail", default: false, null: false
    t.integer "advertisement", default: 0, null: false
    t.integer "hair_type"
    t.integer "prefecture_id"
    t.integer "area_id"
    t.string "picture"
    t.integer "hair_style"
    t.integer "age"
  end

end
