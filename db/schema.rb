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

ActiveRecord::Schema.define(version: 20140305221612) do

  create_table "admin_management_admin_management_users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.integer  "phone"
    t.string   "admin",      default: "customer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_management_orders", force: true do |t|
    t.integer  "product_id"
    t.string   "status"
    t.integer  "customer_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seller_management_everyday_recommends", force: true do |t|
    t.integer  "seller_id"
    t.string   "image"
    t.string   "url"
    t.boolean  "is_display", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seller_management_product_infos", force: true do |t|
    t.integer  "seller_id"
    t.string   "category"
    t.string   "name"
    t.integer  "price"
    t.string   "image"
    t.string   "url"
    t.string   "describe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
