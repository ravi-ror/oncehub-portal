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

ActiveRecord::Schema.define(version: 2020_01_05_211012) do

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "chat_rooms_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chat_room_id", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.float "amount"
    t.integer "month"
    t.integer "year"
    t.integer "status"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "inspirational_quotes", force: :cascade do |t|
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pointing_poker_channels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pointing_poker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.index ["pointing_poker_id"], name: "index_pointing_poker_channels_on_pointing_poker_id"
  end

  create_table "pointing_pokers", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pointing_pokers_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "point"
    t.integer "user_id"
    t.integer "pointing_poker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pointing_poker_id"], name: "index_points_on_pointing_poker_id"
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "retro_responses", force: :cascade do |t|
    t.string "good"
    t.string "bad"
    t.integer "user_id"
    t.integer "retro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["retro_id"], name: "index_retro_responses_on_retro_id"
    t.index ["user_id"], name: "index_retro_responses_on_user_id"
  end

  create_table "retros", force: :cascade do |t|
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "sprint_name"
    t.index ["user_id"], name: "index_retros_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "first_name"
    t.string "last_name"
    t.text "about"
    t.text "hobbies"
    t.integer "team_id"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
