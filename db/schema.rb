# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_14_212813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer "position_id"
    t.integer "candidate_id"
    t.boolean "submitted", default: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.float "gpa"
    t.string "education_level"
    t.string "native_language"
    t.string "second_language"
    t.string "password_digest"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "company_logo"
  end

  create_table "positions", force: :cascade do |t|
    t.string "api_id"
    t.string "position_type"
    t.string "url"
    t.datetime "created_at"
    t.string "location"
    t.string "title"
    t.string "description"
    t.string "how_to_apply"
    t.integer "company_id"
  end

end
