class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :crypted_password
      t.timestamps
    end
  end
end
