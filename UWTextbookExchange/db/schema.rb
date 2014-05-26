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

ActiveRecord::Schema.define(version: 20140526014551) do

  create_table "books", force: true do |t|
    t.text     "book_title", limit: 50, null: false
    t.string   "user1"
    t.string   "user2"
    t.string   "user3"
    t.string   "user4"
    t.string   "user5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name", limit: 20,  null: false
    t.text     "book1",       limit: 100
    t.text     "book2",       limit: 100
    t.text     "book3",       limit: 100
    t.text     "book4",       limit: 100
    t.text     "book5",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                    null: false
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 100, null: false
    t.string   "password_digest",             null: false
    t.integer  "book_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
