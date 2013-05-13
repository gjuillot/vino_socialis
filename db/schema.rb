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

ActiveRecord::Schema.define(:version => 20130513070625) do

  create_table "area_color_grapes", :force => true do |t|
    t.integer  "area_id"
    t.string   "color"
    t.integer  "grape_variety_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "area_color_grapes", ["area_id"], :name => "index_area_color_grapes_on_area_id"
  add_index "area_color_grapes", ["grape_variety_id"], :name => "index_area_color_grapes_on_grape_variety_id"

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
    t.string   "geology"
  end

  add_index "areas", ["region_id"], :name => "index_areas_on_region_id"
  add_index "areas", ["slug"], :name => "index_areas_on_slug"

  create_table "bottles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wine_id"
    t.integer  "vintage"
    t.string   "volume"
    t.date     "date"
    t.string   "channel"
    t.decimal  "price",              :precision => 5, :scale => 2
    t.string   "channel_comments"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "remaining_quantity"
    t.integer  "initial_quantity"
    t.string   "comments"
    t.decimal  "current_value",      :precision => 5, :scale => 2
    t.integer  "drink_min"
    t.integer  "drink_max"
    t.integer  "drink_best"
  end

  add_index "bottles", ["wine_id"], :name => "index_bottles_on_wine_id"

  create_table "color_volumes", :force => true do |t|
    t.integer  "region_id"
    t.integer  "area_id"
    t.string   "year"
    t.decimal  "volume"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "color_volumes", ["area_id"], :name => "index_color_volumes_on_area_id"
  add_index "color_volumes", ["region_id"], :name => "index_color_volumes_on_region_id"

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

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image_url"
    t.string   "image_link"
    t.string   "image_source"
    t.string   "slug"
  end

  add_index "countries", ["slug"], :name => "index_countries_on_slug"

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
    t.string   "slug"
  end

  add_index "estates", ["slug"], :name => "index_estates_on_slug"
  add_index "estates", ["user_id"], :name => "index_estates_on_user_id"

  create_table "glossaries", :force => true do |t|
    t.string   "lang"
    t.string   "word"
    t.text     "definition"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grape_varieties", :force => true do |t|
    t.string   "name"
    t.boolean  "validation", :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "slug"
  end

  add_index "grape_varieties", ["slug"], :name => "index_grape_varieties_on_slug"

  create_table "grape_varieties_wines", :id => false, :force => true do |t|
    t.integer "wine_id"
    t.integer "grape_variety_id"
  end

  create_table "labels", :force => true do |t|
    t.integer  "wine_id"
    t.boolean  "validation"
    t.string   "image"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "user_id",    :default => 1
  end

  add_index "labels", ["wine_id"], :name => "index_labels_on_wine_id"

  create_table "mouth_flavors", :force => true do |t|
    t.string "name"
  end

  create_table "mouth_flavors_tastings", :id => false, :force => true do |t|
    t.integer "mouth_flavor_id"
    t.integer "tasting_id"
  end

  create_table "nose_flavors", :force => true do |t|
    t.string "name"
  end

  create_table "nose_flavors_tastings", :id => false, :force => true do |t|
    t.integer "nose_flavor_id"
    t.integer "tasting_id"
  end

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

  create_table "pairings", :force => true do |t|
    t.integer  "tasting_id"
    t.string   "dish"
    t.integer  "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pairings", ["tasting_id"], :name => "index_pairings_on_tasting_id"

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "is_read",                       :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "slug"
    t.string   "image_url"
    t.string   "image_source"
    t.string   "image_link"
    t.integer  "image_span",                :default => 6
    t.integer  "image_right_column_length", :default => 20
  end

  add_index "regions", ["country_id"], :name => "index_regions_on_country_id"
  add_index "regions", ["slug"], :name => "index_regions_on_slug"

  create_table "superficies", :force => true do |t|
    t.integer "region_id"
    t.integer "area_id"
    t.string  "year"
    t.integer "superficy"
    t.string  "source"
  end

  add_index "superficies", ["area_id"], :name => "index_superficies_on_area_id"
  add_index "superficies", ["region_id"], :name => "index_superficies_on_region_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tastings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wine_id"
    t.integer  "vintage"
    t.date     "date"
    t.integer  "note"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.text     "public_comment"
    t.text     "private_comment"
    t.integer  "eye_intensity",     :default => 0
    t.integer  "eye_color",         :default => 0
    t.integer  "nose_intensity",    :default => 0
    t.integer  "nose_complexity",   :default => 0
    t.integer  "mouth_acidity",     :default => 0
    t.integer  "mouth_bitterness",  :default => 0
    t.integer  "mouth_alcohol",     :default => 0
    t.integer  "mouth_sweet",       :default => 0
    t.integer  "mouth_tanins",      :default => 0
    t.integer  "mouth_co2",         :default => 0
    t.integer  "mouth_complexity",  :default => 0
    t.integer  "mouth_persistence", :default => 0
  end

  add_index "tastings", ["user_id"], :name => "index_tastings_on_user_id"
  add_index "tastings", ["wine_id"], :name => "index_tastings_on_wine_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "",        :null => false
    t.string   "email",                  :default => "",        :null => false
    t.string   "encrypted_password",     :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "role"
    t.string   "locale"
    t.boolean  "tutorial",               :default => true
    t.string   "date_format",            :default => "default"
    t.string   "currency",               :default => "€"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vintages", :force => true do |t|
    t.string   "area"
    t.integer  "year"
    t.integer  "user_id"
    t.integer  "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "volumes", :force => true do |t|
    t.integer  "region_id"
    t.integer  "area_id"
    t.string   "year"
    t.integer  "volume"
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "volumes", ["area_id"], :name => "index_volumes_on_area_id"
  add_index "volumes", ["region_id"], :name => "index_volumes_on_region_id"

  create_table "wine_rack_positions", :force => true do |t|
    t.integer  "wine_rack_id"
    t.integer  "bottle_id"
    t.integer  "row"
    t.integer  "column"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "total_row",    :default => 1
    t.integer  "total_column", :default => 1
  end

  add_index "wine_rack_positions", ["bottle_id"], :name => "index_wine_rack_bottles_on_bottle_id"
  add_index "wine_rack_positions", ["wine_rack_id"], :name => "index_wine_rack_bottles_on_wine_rack_id"

  create_table "wine_racks", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "rows",          :default => 4
    t.integer  "columns",       :default => 5
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "total_rows",    :default => 2
    t.integer  "total_columns", :default => 3
    t.string   "layout",        :default => "simple"
  end

  add_index "wine_racks", ["user_id"], :name => "index_wine_racks_on_user_id"

  create_table "wines", :force => true do |t|
    t.string   "name"
    t.integer  "estate_id"
    t.integer  "area_id"
    t.text     "info"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "validation"
    t.string   "wine_color"
    t.string   "temperature"
    t.string   "slug"
  end

  add_index "wines", ["area_id"], :name => "index_wines_on_area_id"
  add_index "wines", ["estate_id"], :name => "index_wines_on_estate_id"
  add_index "wines", ["slug"], :name => "index_wines_on_slug"
  add_index "wines", ["user_id"], :name => "index_wines_on_user_id"

end
