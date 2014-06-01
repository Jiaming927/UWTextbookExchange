class CreateUsers < ActiveRecord::Migration
  def up
    drop_table :users
    create_table :users do |t|
      t.string :username, null: false
      t.string :first_name, limit: 25
      t.string :last_name, limit:50
      t.string :email, limit: 100, null:false
      t.string :password_digest, null: false
      t.integer :book_number

      t.timestamps
    end
  end

  def down
      drop_table :users
  end
end
