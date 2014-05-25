class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  t.string :user
      t.string :first_name, limit: 25
      t.string :last_name, limit:50
      t.string :email, limit: 100, default: "", null:false
      t.string :password_digest
      t.integer :book_number
      t.timestamps
    end
  end
end