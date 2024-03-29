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

ActiveRecord::Schema.define(:version => 20130410201217) do

  create_table "blocks", :force => true do |t|
    t.integer  "story_id"
    t.integer  "block_number"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "first_block",       :default => false
    t.boolean  "last_block",        :default => false
    t.text     "text"
    t.integer  "total_start_index"
  end

  add_index "blocks", ["block_number"], :name => "index_blocks_on_block_number"

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.integer  "page_number"
    t.integer  "font_size"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "bookmarks", ["story_id"], :name => "index_bookmarks_on_story_id"

  create_table "stories", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "title"
    t.integer  "total_length"
    t.string   "cover_image"
    t.string   "tags"
    t.integer  "views_count",     :default => 0
    t.integer  "bookmarks_count", :default => 0
  end

  create_table "story_views", :force => true do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_auths", :force => true do |t|
    t.integer  "user_id"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_email_hashes", :force => true do |t|
    t.integer  "user_id"
    t.string   "hash_text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_stats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "own_stories_views",       :default => 0
    t.integer  "own_stories_bookmarks",   :default => 0
    t.integer  "total_stories_views",     :default => 0
    t.integer  "total_stories_bookmarks", :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "facebook_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "username"
    t.integer  "state",       :default => 0
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
