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

ActiveRecord::Schema.define(version: 2021_02_26_161059) do

  create_table "networks", force: :cascade do |t|
    t.text "socialname"
    t.integer "trainee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainee_id"], name: "index_networks_on_trainee_id"
  end

  create_table "social_media", force: :cascade do |t|
    t.text "socialname"
    t.integer "trainee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainee_id"], name: "index_social_media_on_trainee_id"
  end

  create_table "trainees", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "city"
    t.string "country"
    t.integer "phone"
    t.text "bio"
    t.string "preference"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "networks", "trainees"
  add_foreign_key "social_media", "trainees"
end
