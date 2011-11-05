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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111105175846) do

  create_table "page_edits", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "page_id"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_edits", ["page_id"], :name => "index_page_edits_on_page_id"
  add_index "page_edits", ["space_id"], :name => "index_page_edits_on_space_id"
  add_index "page_edits", ["user_id"], :name => "index_page_edits_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "title",          :limit => 300
    t.string   "ancestry"
    t.text     "body"
    t.integer  "space_id"
    t.integer  "user_id"
    t.integer  "last_editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["last_editor_id"], :name => "index_pages_on_last_editor_id"
  add_index "pages", ["space_id"], :name => "index_pages_on_space_id"
  add_index "pages", ["user_id"], :name => "index_pages_on_user_id"

  create_table "spaces", :force => true do |t|
    t.string   "name",       :limit => 100
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",          :limit => 50
    t.string   "tuid",          :limit => 300
    t.integer  "login_count",                  :default => 0
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
