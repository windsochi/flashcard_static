class SorceryCore < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
  end

  add_index :users, :email, unique: true
end
