class CreateBooksToUsers < ActiveRecord::Migration
  def change
    create_table :books_to_users do |t|
      t.text :book
      t.string :user1
      t.string :user2
      t.string :user3
      t.string :user4
      t.string :user5



      t.timestamps
    end
  end
end
