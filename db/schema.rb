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

ActiveRecord::Schema.define(:version => 20120823134218) do

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "areas", ["region_id"], :name => "index_areas_on_region_id"

  create_table "bottles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wine_id"
    t.integer  "vintage"
    t.string   "volume"
    t.date     "date"
    t.string   "channel"
    t.decimal  "price",              :precision => 5, :scale => 2
    t.string   "comments"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "remaining_quantity"
    t.integer  "initial_quantity"
  end

  add_index "bottles", ["wine_id"], :name => "index_bottles_on_wine_id"

  create_table "consumptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bottle_id"
    t.date     "date"
    t.integer  "quantity"
    t.string   "reasons"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "consumptions", ["bottle_id"], :name => "index_consumptions_on_bottle_id"
  add_index "consumptions", ["user_id"], :name => "index_consumptions_on_user_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image_url"
    t.string   "image_link"
    t.string   "image_source"
  end

  create_table "estates", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "owner"
    t.string   "address"
    t.string   "zip_code"
    t.string   "town"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "www"
    t.boolean  "validation", :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "estates", ["user_id"], :name => "index_estates_on_user_id"

  create_table "pairings", :force => true do |t|
    t.integer  "tasting_id"
    t.string   "dish"
    t.integer  "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pairings", ["tasting_id"], :name => "index_pairings_on_tasting_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["country_id"], :name => "index_regions_on_country_id"

  create_table "tastings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wine_id"
    t.integer  "vintage"
    t.date     "date"
    t.integer  "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tastings", ["user_id"], :name => "index_tastings_on_user_id"
  add_index "tastings", ["wine_id"], :name => "index_tastings_on_wine_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "locale"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wine_recommandations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wine_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wine_recommandations", ["user_id"], :name => "index_wine_recommandations_on_user_id"
  add_index "wine_recommandations", ["wine_id"], :name => "index_wine_recommandations_on_wine_id"

  create_table "wines", :force => true do |t|
    t.string   "name"
    t.integer  "estate_id"
    t.integer  "area_id"
    t.text     "info"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "validation"
    t.string   "wine_color"
  end

  add_index "wines", ["area_id"], :name => "index_wines_on_area_id"
  add_index "wines", ["estate_id"], :name => "index_wines_on_estate_id"
  add_index "wines", ["user_id"], :name => "index_wines_on_user_id"

end
