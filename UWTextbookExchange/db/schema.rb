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

ActiveRecord::Schema.define(version: 20140525004154) do

  create_table "books_to_users", force: true do |t|
    t.text     "book"
    t.string   "user1"
    t.string   "user2"
    t.string   "user3"
    t.string   "user4"
    t.string   "user5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_to_books", force: true do |t|
    t.string   "course"
    t.text     "book1"
    t.text     "book2"
    t.text     "book3"
    t.text     "book4"
    t.text     "book5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user"
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "password_digest"
    t.integer  "book_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
