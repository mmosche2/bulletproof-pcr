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

ActiveRecord::Schema.define(version: 20141221172950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adverse_events", force: true do |t|
    t.datetime "origination_date"
    t.integer  "user_id"
    t.integer  "complaint_id"
    t.datetime "date_of_event"
    t.integer  "age"
    t.string   "gender"
    t.integer  "weight"
    t.text     "event_description"
    t.text     "customer_feeling"
    t.string   "attending_health_professional"
    t.boolean  "hospitalized"
    t.string   "hospital_location"
    t.text     "relevant_tests"
    t.text     "other_relevant_history"
    t.string   "frequency"
    t.string   "usage"
    t.string   "timing"
    t.string   "therapy_dates"
    t.boolean  "abated_after_use_stopped"
    t.boolean  "reappeared_after_reintroduced"
    t.text     "previous_usage_history"
    t.text     "customer_usage_reason"
    t.text     "other_therapies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adverse_events", ["complaint_id"], name: "index_adverse_events_on_complaint_id", using: :btree
  add_index "adverse_events", ["user_id"], name: "index_adverse_events_on_user_id", using: :btree

  create_table "complaints", force: true do |t|
    t.datetime "received_date"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.string   "order_number"
    t.text     "immediate_response"
    t.boolean  "adverse_reaction"
    t.text     "summary"
    t.text     "correspondence_history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.boolean  "is_returned"
    t.boolean  "is_refunded"
    t.decimal  "refund_amount"
    t.integer  "return_quantity"
    t.string   "pc_number"
  end

  add_index "complaints", ["customer_id"], name: "index_complaints_on_customer_id", using: :btree
  add_index "complaints", ["user_id"], name: "index_complaints_on_user_id", using: :btree

  create_table "contact_attempts", force: true do |t|
    t.integer  "adverse_event_id"
    t.integer  "user_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_attempts", ["adverse_event_id"], name: "index_contact_attempts_on_adverse_event_id", using: :btree
  add_index "contact_attempts", ["user_id"], name: "index_contact_attempts_on_user_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", using: :btree
  add_index "customers", ["name"], name: "index_customers_on_name", using: :btree

  create_table "faulty_products", force: true do |t|
    t.integer  "product_id"
    t.integer  "complaint_id"
    t.integer  "quantity_reported"
    t.integer  "size_count"
    t.string   "lot"
    t.datetime "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "returned"
    t.text     "reason_for_return"
    t.integer  "credit_amount_in_pennies"
    t.datetime "credit_issued_date"
    t.integer  "return_auth_num"
    t.text     "condition"
    t.boolean  "quarantined"
    t.integer  "quarantined_area_by"
    t.datetime "quarantined_area_date"
    t.integer  "quarantined_sticker_by"
    t.datetime "quarantined_sticker_date"
    t.integer  "return_id"
    t.integer  "quantity_received"
  end

  add_index "faulty_products", ["complaint_id"], name: "index_faulty_products_on_complaint_id", using: :btree
  add_index "faulty_products", ["product_id"], name: "index_faulty_products_on_product_id", using: :btree
  add_index "faulty_products", ["return_id"], name: "index_faulty_products_on_return_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "sku"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "returns", force: true do |t|
    t.datetime "originating_date"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "complaint_id"
    t.integer  "discard_management_approval_by"
    t.datetime "discard_management_approval_date"
    t.integer  "discard_qc_approval_by"
    t.datetime "discard_qc_approval_date"
    t.string   "method_of_disposal"
    t.integer  "discard_completed_by"
    t.datetime "discard_completed_date"
    t.integer  "discard_witnessed_by"
    t.datetime "discard_witnessed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_number"
    t.string   "status"
    t.string   "return_type"
    t.string   "ra_number"
  end

  add_index "returns", ["complaint_id"], name: "index_returns_on_complaint_id", using: :btree
  add_index "returns", ["customer_id"], name: "index_returns_on_customer_id", using: :btree
  add_index "returns", ["user_id"], name: "index_returns_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
    t.boolean  "notify_for_aer"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
