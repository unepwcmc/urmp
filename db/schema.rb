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

ActiveRecord::Schema.define(:version => 20121005103915) do

  create_table "criteria", :force => true do |t|
    t.integer  "principle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.text     "description"
    t.string   "name"
  end

  create_table "factsheets", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id",             :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "factsheets", ["resource_id"], :name => "index_factsheets_on_resource_id"

  create_table "principles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.text     "description"
    t.string   "name"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "resource_links", :force => true do |t|
    t.text     "reference"
    t.integer  "criterion_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "cached_name"
    t.text     "numeric_reference"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "language"
    t.string   "resource_date"
    t.string   "institution"
    t.text     "description"
    t.boolean  "made_by_un_redd"
    t.string   "theme"
    t.string   "resource_type"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "technical_expertise"
    t.string   "audience"
    t.string   "acitivity"
    t.string   "country"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
