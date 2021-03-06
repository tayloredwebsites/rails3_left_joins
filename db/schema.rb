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

ActiveRecord::Schema.define(:version => 20130121150026) do

  create_table "fk_references", :force => true do |t|
    t.integer  "lookup_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "fk_references", ["lookup_id"], :name => "index_fk_references_on_lookup_id"

  create_table "lookups", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "through_references", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "through_tables", :force => true do |t|
    t.integer  "through_reference_id"
    t.integer  "lookup_id"
    t.string   "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "through_tables", ["lookup_id"], :name => "index_through_tables_on_lookup_id"
  add_index "through_tables", ["through_reference_id"], :name => "index_through_tables_on_through_reference_id"

end
