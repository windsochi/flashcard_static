class AddUserIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :user_id, :string
  end
end
