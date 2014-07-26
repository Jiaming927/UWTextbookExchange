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

ActiveRecord::Schema.define(version: 20140726171514) do

  create_table "bookinfos", force: true do |t|
    t.text    "book_title",                         null: false
    t.string  "author",      limit: 50
    t.decimal "price"
    t.string  "course_name", limit: 20,             null: false
    t.integer "number",                 default: 0, null: false
  end

  add_index "bookinfos", ["book_title"], name: "index_bookinfos_on_book_title", unique: true

  create_table "books", force: true do |t|
    t.text     "book_title", null: false
    t.string   "username"
    t.datetime "created_at"
  end

  add_index "books", ["book_title"], name: "index_books_on_book_title"

  create_table "borrowedbooks", force: true do |t|
    t.string   "username",   null: false
    t.text     "book_title", null: false
    t.datetime "created_at"
  end

  add_index "borrowedbooks", ["username"], name: "index_borrowedbooks_on_username"

  create_table "channels", force: true do |t|
    t.string  "channel_name",              null: false
    t.integer "total_message", default: 0, null: false
    t.integer "first_side",    default: 0, null: false
    t.integer "second_side",   default: 0, null: false
  end

  add_index "channels", ["channel_name"], name: "index_channels_on_channel_name", unique: true

  create_table "courses", force: true do |t|
    t.string  "course_name", limit: 20,             null: false
    t.integer "number",                 default: 0, null: false
    t.text    "book1"
    t.text    "book2"
    t.text    "book3"
    t.text    "book4"
    t.text    "book5"
    t.text    "book6"
    t.text    "book7"
    t.text    "book8"
    t.text    "book9"
    t.text    "book10"
    t.text    "book11"
    t.text    "book12"
    t.text    "book13"
    t.text    "book14"
    t.text    "book15"
  end

  add_index "courses", ["course_name"], name: "index_courses_on_course_name", unique: true

  create_table "messages", force: true do |t|
    t.string   "sender",     null: false
    t.string   "receiver",   null: false
    t.text     "content",    null: false
    t.datetime "created_at"
  end

  create_table "msgcounts", force: true do |t|
    t.string  "username",             null: false
    t.integer "count",    default: 0, null: false
    t.integer "unread",   default: 0, null: false
  end

  add_index "msgcounts", ["username"], name: "index_msgcounts_on_username", unique: true

  create_table "ownedbooks", force: true do |t|
    t.string   "username",   null: false
    t.text     "book_title", null: false
    t.datetime "created_at"
  end

  add_index "ownedbooks", ["username"], name: "index_ownedbooks_on_username"

  create_table "tradedbooks", force: true do |t|
    t.string   "username",   null: false
    t.text     "book_title", null: false
    t.datetime "created_at"
  end

  add_index "tradedbooks", ["username"], name: "index_tradedbooks_on_username"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
