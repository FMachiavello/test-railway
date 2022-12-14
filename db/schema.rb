# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_01_183614) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_menus", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_dish_menus_on_dish_id"
    t.index ["menu_id", "dish_id"], name: "index_dish_menus_on_menu_id_and_dish_id", unique: true
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alternative", default: false, null: false
  end

  create_table "dishes_menus", id: false, force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "menu_id", null: false
    t.index ["dish_id", "menu_id"], name: "index_dishes_menus_on_dish_id_and_menu_id"
    t.index ["menu_id", "dish_id"], name: "index_dishes_menus_on_menu_id_and_dish_id"
  end

  create_table "menus", force: :cascade do |t|
    t.boolean "draft", default: true, null: false
    t.date "menu_for"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_for"], name: "index_menus_on_menu_for", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_id", null: false
    t.bigint "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_orders_on_dish_id"
    t.index ["menu_id"], name: "index_orders_on_menu_id"
    t.index ["user_id", "menu_id"], name: "index_orders_on_user_id_and_menu_id", unique: true
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile_phone"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "menus"
  add_foreign_key "orders", "users"
end
