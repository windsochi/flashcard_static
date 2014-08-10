class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :password
      t.timestamps
    end

    create_table :cards do |t|
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
