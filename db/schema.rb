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

ActiveRecord::Schema.define(version: 20151219185255) do

  create_table "login_events", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_attachment_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_attachments", force: true do |t|
    t.integer  "project_id"
    t.string   "resource"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_name"
    t.integer  "project_attachment_type_id"
    t.string   "title",                      default: ""
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.text     "why"
    t.string   "duration"
    t.text     "launch_method"
    t.text     "teacher_moves"
    t.text     "solution"
    t.string   "author_name"
    t.string   "author_link"
    t.text     "problem_statement"
    t.text     "history"
    t.text     "pathways"
    t.text     "pitfalls"
    t.text     "extensions"
    t.text     "hints"
    t.string   "featured_image"
    t.integer  "status",            default: 0
    t.integer  "user_id"
    t.string   "feature_order"
  end

  create_table "projects_standards", id: false, force: true do |t|
    t.integer "project_id",  null: false
    t.integer "standard_id", null: false
  end

  add_index "projects_standards", ["project_id", "standard_id"], name: "index_projects_standards_on_project_id_and_standard_id"
  add_index "projects_standards", ["standard_id", "project_id"], name: "index_projects_standards_on_standard_id_and_project_id"

  create_table "projects_tags", id: false, force: true do |t|
    t.integer "project_id", null: false
    t.integer "tag_id",     null: false
  end

  add_index "projects_tags", ["project_id", "tag_id"], name: "index_projects_tags_on_project_id_and_tag_id"
  add_index "projects_tags", ["tag_id", "project_id"], name: "index_projects_tags_on_tag_id_and_project_id"

  create_table "slider_objects", force: true do |t|
    t.text     "description"
    t.string   "file_name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resource"
  end

  create_table "standards", force: true do |t|
    t.string   "code"
    t.string   "category"
    t.text     "subcategory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "featured_image"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
