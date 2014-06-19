class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username, null: false
      t.string :first_name, null: false, limit: 25
      t.string :last_name,null: false,  limit:50
      t.string :email, limit: 100, null:false
      t.string :password_digest, null: false
      t.integer :book_number, default: 0

      t.timestamps
    end
  end

  def down
      drop_table :users
  end
end
