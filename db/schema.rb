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

ActiveRecord::Schema.define(version: 20_201_030_153_439) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'appointments', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'therapist_id', null: false
    t.datetime 'start_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['therapist_id'], name: 'index_appointments_on_therapist_id'
    t.index ['user_id'], name: 'index_appointments_on_user_id'
  end

  create_table 'specialties', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_specialties_on_name', unique: true
  end

  create_table 'therapists', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'img_url'
    t.index ['user_id'], name: 'idx_uk_therapists_on_user_id', unique: true
    t.index ['user_id'], name: 'index_therapists_on_user_id'
  end

  create_table 'therapists_specialties', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'specialty_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['specialty_id'], name: 'index_therapists_specialties_on_specialty_id'
    t.index ['user_id'], name: 'index_therapists_specialties_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', null: false
    t.text 'email', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
    t.string 'fullname'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  add_foreign_key 'appointments', 'therapists', primary_key: 'user_id'
  add_foreign_key 'appointments', 'users'
  add_foreign_key 'therapists', 'users'
  add_foreign_key 'therapists_specialties', 'specialties'
  add_foreign_key 'therapists_specialties', 'users'
end
