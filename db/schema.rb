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

ActiveRecord::Schema[7.1].define(version: 2023_10_08_130404) do
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_names"
    t.integer "booked_seat"
    t.integer "seat_id", null: false
    t.datetime "booking_date"
    t.index ["bus_id"], name: "index_bookings_on_bus_id"
    t.index ["seat_id"], name: "index_bookings_on_seat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buses", force: :cascade do |t|
    t.integer "bus_type"
    t.integer "capacity"
    t.date "departure_date"
    t.date "arrival_date"
    t.decimal "rating", precision: 1, scale: 1
    t.integer "seat_price"
    t.boolean "available"
    t.integer "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bus_destination"
    t.string "bus_arrival"
    t.string "bus_name"
    t.index ["route_id"], name: "index_buses_on_route_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "seat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "reservation_date"
    t.index ["seat_id"], name: "index_reservations_on_seat_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "route_name"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "bus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seat_no"
    t.integer "seat_price"
    t.string "status", default: "available"
    t.index ["bus_id"], name: "index_seats_on_bus_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "bookings", "buses"
  add_foreign_key "bookings", "seats"
  add_foreign_key "bookings", "users"
  add_foreign_key "buses", "routes"
  add_foreign_key "reservations", "seats"
  add_foreign_key "reservations", "users"
  add_foreign_key "seats", "buses"
end
