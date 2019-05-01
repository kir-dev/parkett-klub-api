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

ActiveRecord::Schema.define(version: 20190501111606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "photo"
    t.text     "content"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands_parties", force: :cascade do |t|
    t.integer "band_id"
    t.integer "party_id"
    t.index ["band_id"], name: "index_bands_parties_on_band_id", using: :btree
    t.index ["party_id"], name: "index_bands_parties_on_party_id", using: :btree
  end

  create_table "dance_courses", force: :cascade do |t|
    t.integer  "dance_teacher_id"
    t.integer  "dance_id"
    t.string   "level"
    t.string   "length"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["dance_id"], name: "index_dance_courses_on_dance_id", using: :btree
    t.index ["dance_teacher_id"], name: "index_dance_courses_on_dance_teacher_id", using: :btree
  end

  create_table "dance_teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dance_types", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "image"
  end

  create_table "dances", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "dance_type_id"
    t.index ["dance_type_id"], name: "index_dances_on_dance_type_id", using: :btree
  end

  create_table "djs", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "djs_parties", force: :cascade do |t|
    t.integer "dj_id"
    t.integer "party_id"
    t.index ["dj_id"], name: "index_djs_parties_on_dj_id", using: :btree
    t.index ["party_id"], name: "index_djs_parties_on_party_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "position"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "photo"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "program"
    t.text     "content"
    t.string   "facebook_event"
    t.string   "application_form"
    t.string   "spot"
    t.string   "bss"
    t.integer  "dance_course_id"
    t.string   "bss_cover"
    t.string   "spot_cover"
    t.integer  "dance_type_id"
    t.index ["dance_course_id"], name: "index_parties_on_dance_course_id", using: :btree
    t.index ["dance_type_id"], name: "index_parties_on_dance_type_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.string   "authsch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
    t.index ["member_id"], name: "index_users_on_member_id", using: :btree
  end

  create_table "workshops", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "photo"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "program"
    t.text     "content"
    t.text     "theme"
    t.string   "facebook_event"
    t.string   "application_form"
    t.integer  "party_id"
    t.integer  "dance_id"
    t.integer  "dance_teacher_id"
    t.index ["dance_id"], name: "index_workshops_on_dance_id", using: :btree
    t.index ["dance_teacher_id"], name: "index_workshops_on_dance_teacher_id", using: :btree
    t.index ["party_id"], name: "index_workshops_on_party_id", using: :btree
  end

  add_foreign_key "bands_parties", "bands"
  add_foreign_key "bands_parties", "parties"
  add_foreign_key "dance_courses", "dance_teachers"
  add_foreign_key "dance_courses", "dances"
  add_foreign_key "djs_parties", "djs"
  add_foreign_key "djs_parties", "parties"
  add_foreign_key "parties", "dance_types"
  add_foreign_key "users", "members"
end
