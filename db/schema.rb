ActiveRecord::Schema.define(version: 20140825150237) do

  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.text     "original_text"
    t.text     "translated_text"
    t.datetime "review_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
  end
  add_index "cards", ["user_id"]

  create_table "users", force: true do |t|
    t.text     "email"
    t.text     "crypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
