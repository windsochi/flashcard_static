# encoding: UTF-8
ActiveRecord::Schema.define(version: 20140722155038) do

  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.text     "original_text"
    t.text     "translated_text"
    t.datetime "review_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
