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

ActiveRecord::Schema.define(version: 20151016234856) do

  create_table "animals", force: true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.string   "name"
    t.string   "breed"
    t.integer  "age"
    t.string   "parent_breed"
    t.text     "personality"
    t.string   "adoption_fee"
    t.text     "note"
    t.boolean  "active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  create_table "animals_vaccinations", id: false, force: true do |t|
    t.integer "vaccination_id", null: false
    t.integer "animal_id",      null: false
  end

  create_table "interests", force: true do |t|
    t.integer  "user_id"
    t.integer  "animal_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "gender"
    t.text     "family_info"
    t.text     "pet_info"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address"
    t.text     "residence_info"
    t.text     "about"
    t.boolean  "active"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  create_table "vaccinations", force: true do |t|
    t.integer  "animal_id"
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
