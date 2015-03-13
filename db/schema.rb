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

ActiveRecord::Schema.define(version: 20150313174307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "quantity"
    t.decimal  "price"
    t.integer  "moq"
    t.string   "when_ready"
    t.string   "brand"
    t.string   "sku"
    t.string   "mfr"
    t.decimal  "msrp"
    t.string   "vendor"
    t.string   "category1"
    t.string   "category2"
    t.integer  "upc"
    t.string   "restrictions"
    t.string   "warehouse_zip"
    t.string   "warranty"
    t.string   "link1"
    t.string   "link2"
    t.string   "link1_title"
    t.string   "link2_title"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
=======
    t.integer  "vendor_id"
>>>>>>> irina
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "email_biz"
    t.string   "email_finance"
    t.string   "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
