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

ActiveRecord::Schema.define(version: 20170919070601) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "town"
    t.string   "code"
    t.boolean  "owner",                  default: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["invitation_token"], name: "index_admins_on_invitation_token", unique: true
  add_index "admins", ["invitations_count"], name: "index_admins_on_invitations_count"
  add_index "admins", ["invited_by_id"], name: "index_admins_on_invited_by_id"
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "blog_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type"

  create_table "custom_mails", force: :cascade do |t|
    t.string   "recipient_mail"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "fposts", force: :cascade do |t|
    t.string   "title"
    t.string   "facebook_id"
    t.string   "link_url"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "galeria_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historia_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.string   "image_title"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"

  create_table "kontakt_katering_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kontakt_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_adds", force: :cascade do |t|
    t.integer  "addable_id"
    t.string   "addable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "body"
  end

  create_table "policy_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.date     "publish_date"
    t.boolean  "draft",        default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "slug"
    t.text     "excerpt"
    t.string   "image"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "price"
    t.text     "description"
    t.text     "catchphrase"
    t.string   "image"
    t.boolean  "publish"
    t.boolean  "expose"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "produkt_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "queries", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "phone"
    t.text     "body"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "from_date"
    t.datetime "to_date"
    t.string   "town"
    t.boolean  "catering_flag"
    t.boolean  "read",          default: false
  end

  create_table "replies", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "query_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "replies", ["query_id"], name: "index_replies_on_query_id"

  create_table "settings", force: :cascade do |t|
    t.integer  "posts_on_wall"
    t.integer  "posts_on_gallery"
    t.string   "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "email"
    t.string   "phone"
    t.string   "motto_line1"
    t.string   "motto_line2"
  end

  create_table "social_icons", force: :cascade do |t|
    t.string   "url_address"
    t.integer  "setting_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "stops", force: :cascade do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "town"
    t.string   "code"
    t.string   "catchphrase",   limit: 100
    t.boolean  "active",                    default: false
    t.datetime "date"
    t.datetime "date_out"
    t.integer  "track_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "stops", ["track_id"], name: "index_stops_on_track_id"

  create_table "tracks", force: :cascade do |t|
    t.string   "route_name"
    t.string   "driver"
    t.string   "truck"
    t.boolean  "active",      default: false
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visit_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "fullname"
    t.string   "ip"
    t.datetime "log_in"
    t.datetime "log_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
