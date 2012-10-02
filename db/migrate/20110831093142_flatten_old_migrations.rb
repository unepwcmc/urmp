class FlattenOldMigrations < ActiveRecord::Migration
  def self.up
    create_table "criteria", :force => true do |t|
      t.integer  "principle_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "number"
    end

    create_table "criterion_translations", :force => true do |t|
      t.integer  "criterion_id"
      t.string   "locale"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "cached_name"
    end

    add_index "criterion_translations", ["criterion_id"], :name => "index_criterion_translations_on_criterion_id"

    create_table "principle_translations", :force => true do |t|
      t.integer  "principle_id"
      t.string   "locale"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "cached_name"
    end

    add_index "principle_translations", ["principle_id"], :name => "index_principle_translations_on_principle_id"

    create_table "principles", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "number"
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

    create_table "resource_link_translations", :force => true do |t|
      t.integer  "resource_link_id"
      t.string   "locale"
      t.text     "reference"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "resource_link_translations", ["resource_link_id"], :name => "index_3d7173407008b1615412f5ecb40093e833a1f8f3"

    create_table "resource_links", :force => true do |t|
      t.text     "reference"
      t.integer  "criterion_id"
      t.integer  "resource_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "cached_name"
      t.text     "numeric_reference"
    end

    create_table "resource_types", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
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
      t.integer  "resource_type_id"
      t.boolean  "made_by_un_redd"
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

  def self.down
    raise 'There is no Way back'
  end
end
