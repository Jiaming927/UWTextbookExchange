class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.text :book_title, null: false, limit:50
      t.string :user1
      t.string :user2
      t.string :user3
      t.string :user4
      t.string :user5
      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
