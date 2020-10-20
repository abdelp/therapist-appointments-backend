ActiveRecord::Schema.define(version: 2020_10_20_161124) do

  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "therapist_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapist_id"], name: "index_appointments_on_therapist_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_specialties_on_name", unique: true
  end

  create_table "therapists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_therapists_on_user_id"
  end

  create_table "therapists_specialties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["specialty_id"], name: "index_therapists_specialties_on_specialty_id"
    t.index ["user_id"], name: "index_therapists_specialties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.text "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "appointments", "therapists"
  add_foreign_key "appointments", "users"
  add_foreign_key "therapists", "users"
  add_foreign_key "therapists_specialties", "specialties"
  add_foreign_key "therapists_specialties", "users"
end
