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

ActiveRecord::Schema.define(version: 2019_02_19_143614) do

  create_table "cards", force: :cascade do |t|
    t.integer "list_id"
    t.integer "epic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "position"
    t.integer "project_id"
    t.integer "user_id"
    t.text "description"
    t.string "status"
    t.integer "story_points"
    t.index ["epic_id"], name: "index_cards_on_epic_id"
    t.index ["list_id"], name: "index_cards_on_list_id"
    t.index ["project_id"], name: "index_cards_on_project_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "epics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "user_id"
    t.index ["project_id"], name: "index_epics_on_project_id"
    t.index ["user_id"], name: "index_epics_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.integer "epic_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "user_id"
    t.integer "position"
    t.index ["epic_id"], name: "index_lists_on_epic_id"
    t.index ["project_id"], name: "index_lists_on_project_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
