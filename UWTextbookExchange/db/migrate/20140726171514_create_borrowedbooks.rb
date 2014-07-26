class CreateBorrowedbooks < ActiveRecord::Migration
  def up
    create_table :borrowedbooks do |t|
      t.string :username, null: false
      t.text :book_title, null: false
      t.column :created_at, :datetime
    end
    add_index :borrowedbooks, :username
  end

  def down
    drop_table :borrowedbooks
  end
end
