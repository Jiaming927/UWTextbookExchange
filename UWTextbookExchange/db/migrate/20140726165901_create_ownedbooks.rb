class CreateOwnedbooks < ActiveRecord::Migration
  def up
    create_table :ownedbooks do |t|
      t.string :username, null: false
      t.text :book_title, null: false
      t.column :created_at, :datetime
    end
    add_index :ownedbooks, :username
  end

  def down
    drop_table :ownedbooks
  end
end
