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

ActiveRecord::Schema.define(version: 20160809175415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "submarine_id"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "total_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["submarine_id"], name: "index_bookings_on_submarine_id", using: :btree
  end

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "submarines", force: :cascade do |t|
    t.string   "name"
    t.string   "type_submarine"
    t.integer  "price_day"
    t.string   "image_url"
    t.text     "description"
    t.integer  "max_number_of_guests"
    t.integer  "port_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["port_id"], name: "index_submarines_on_port_id", using: :btree
  end

  add_foreign_key "bookings", "submarines"
  add_foreign_key "submarines", "ports"
end
