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

ActiveRecord::Schema.define(version: 20161019211207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "customer_id"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
    t.index ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "status",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "category_has_products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_has_products_on_category_id", using: :btree
    t.index ["product_id"], name: "index_category_has_products_on_product_id", using: :btree
  end

  create_table "confirmation_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "code"
    t.float    "amount"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_confirmation_orders_on_address_id", using: :btree
    t.index ["order_id"], name: "index_confirmation_orders_on_order_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupon_uses", force: :cascade do |t|
    t.float    "amount"
    t.integer  "order_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_coupon_uses_on_customer_id", using: :btree
    t.index ["order_id"], name: "index_coupon_uses_on_order_id", using: :btree
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.float    "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_transactions", force: :cascade do |t|
    t.string   "description"
    t.float    "amount"
    t.string   "braintreeid"
    t.string   "braintreetype"
    t.string   "braintreestatus"
    t.integer  "order_id"
    t.integer  "customer_id"
    t.integer  "address_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["address_id"], name: "index_customer_transactions_on_address_id", using: :btree
    t.index ["customer_id"], name: "index_customer_transactions_on_customer_id", using: :btree
    t.index ["order_id"], name: "index_customer_transactions_on_order_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "telephone"
    t.string   "ip"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id", using: :btree
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "name"
    t.integer  "quantity"
    t.float    "price"
    t.float    "length"
    t.float    "width"
    t.float    "height"
    t.float    "weight"
    t.string   "status",      default: "1"
    t.string   "description"
    t.float    "discount"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["order_id"], name: "index_order_products_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "order_status_id"
    t.integer  "address_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  end

  create_table "product_discounts", force: :cascade do |t|
    t.float    "price"
    t.datetime "start"
    t.datetime "end"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_discounts_on_product_id", using: :btree
  end

  create_table "product_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "sort_order"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "price"
    t.float    "length"
    t.float    "width"
    t.float    "height"
    t.float    "weight"
    t.string   "status",      default: "1"
    t.string   "description"
    t.float    "discount"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "returns", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "opened"
    t.string   "return_status"
    t.string   "comment"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_id"], name: "index_returns_on_order_id", using: :btree
    t.index ["product_id"], name: "index_returns_on_product_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "comment"
    t.integer  "rating"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer  "role",                   default: 7,  null: false
    t.string   "auth_token"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "customers"
  add_foreign_key "category_has_products", "categories"
  add_foreign_key "category_has_products", "products"
  add_foreign_key "confirmation_orders", "addresses"
  add_foreign_key "confirmation_orders", "orders"
  add_foreign_key "coupon_uses", "customers"
  add_foreign_key "coupon_uses", "orders"
  add_foreign_key "customer_transactions", "addresses"
  add_foreign_key "customer_transactions", "customers"
  add_foreign_key "customer_transactions", "orders"
  add_foreign_key "customers", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "product_discounts", "products"
  add_foreign_key "product_images", "products"
  add_foreign_key "returns", "orders"
  add_foreign_key "returns", "products"
  add_foreign_key "reviews", "products"
end
