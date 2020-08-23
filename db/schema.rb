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

ActiveRecord::Schema.define(version: 20200823150802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "location"
    t.integer "category"
    t.time "start_time"
    t.time "end_time"
    t.bigint "daily_schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_schedule_id"], name: "index_activities_on_daily_schedule_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "daily_schedules", force: :cascade do |t|
    t.datetime "date"
    t.bigint "weekly_schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weekly_schedule_id"], name: "index_daily_schedules_on_weekly_schedule_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.integer "from_age"
    t.integer "to_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_schedules", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_published"
    t.datetime "published_at"
    t.bigint "program_id"
    t.index ["program_id"], name: "index_weekly_schedules_on_program_id"
  end

  add_foreign_key "activities", "daily_schedules"
  add_foreign_key "children", "parents"
  add_foreign_key "daily_schedules", "weekly_schedules"
  add_foreign_key "weekly_schedules", "programs"
end
