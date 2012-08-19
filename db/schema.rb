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

ActiveRecord::Schema.define(:version => 20120819032453) do

  create_table "assets", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type", :limit => 20
    t.string   "title"
    t.text     "description"
    t.string   "type",            :limit => 20
    t.string   "file"
    t.string   "content_type",    :limit => 25
    t.integer  "file_size"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "bonuses", :force => true do |t|
    t.string   "name"
    t.text     "short_description"
    t.string   "image"
    t.integer  "position"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "url"
  end

  create_table "downloads", :force => true do |t|
    t.integer  "downloadable_id"
    t.string   "downloadable_type"
    t.string   "asset"
    t.string   "content_type"
    t.integer  "file_size"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "download_type_cd"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "speaker_id"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "slug"
    t.integer  "event_id"
    t.integer  "ia_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.datetime "replay_start_time"
    t.datetime "replay_end_time"
  end

  add_index "events", ["slug"], :name => "index_events_on_slug", :unique => true

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "total",      :precision => 6, :scale => 2
    t.string   "status"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "orders", ["order_id"], :name => "index_orders_on_order_id"
  add_index "orders", ["product_id"], :name => "index_orders_on_product_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "active",     :default => true, :null => false
    t.integer  "position"
  end

  create_table "products", :force => true do |t|
    t.integer  "speaker_id"
    t.string   "name"
    t.integer  "product_id"
    t.string   "cart_pid"
    t.text     "short_description"
    t.string   "image"
    t.string   "slug"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "title"
    t.float    "price"
    t.string   "redirect_url"
    t.text     "description"
    t.float    "regular_price"
    t.string   "youtube_id"
    t.boolean  "digital_download",  :default => true, :null => false
    t.integer  "position"
  end

  add_index "products", ["product_id"], :name => "index_products_on_product_id"
  add_index "products", ["slug"], :name => "index_products_on_slug", :unique => true

  create_table "speakers", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short_bio"
    t.text     "bio"
    t.string   "image"
    t.string   "slug"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "speakers", ["slug"], :name => "index_speakers_on_slug", :unique => true

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "slogan"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.integer  "position"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                                     :null => false
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "subscribed",             :default => false, :null => false
    t.boolean  "admin",                  :default => false, :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
