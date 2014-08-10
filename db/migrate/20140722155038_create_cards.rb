class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :original_text
      t.text :translated_text
      t.datetime :review_dat
      t.timestamps
    end
    add_index :cards, :user_id
  end
end
