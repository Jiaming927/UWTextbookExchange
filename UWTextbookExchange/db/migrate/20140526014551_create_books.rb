class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.text :book_title, null: false
      t.string :username
      t.column :created_at, :datetime
    end
	add_index :books, :book_title
  end

  def down
    drop_table :books
  end
end
