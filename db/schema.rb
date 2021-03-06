# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101114054811) do

  create_table "groups", :force => true do |t|
    t.integer  "user_id"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promises", :force => true do |t|
    t.integer  "user_id"
    t.string   "when"
    t.integer  "howlong"
    t.string   "score"
    t.string   "happen"
    t.string   "improvement"
    t.string   "evaluation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "start"
    t.string   "end"
    t.boolean  "allDay"
    t.string   "className"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "student_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "remember_token"
    t.boolean  "admin",              :default => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["student_id"], :name => "index_users_on_student_id", :unique => true

end
