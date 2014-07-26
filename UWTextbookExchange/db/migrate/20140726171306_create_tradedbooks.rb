class CreateTradedbooks < ActiveRecord::Migration
  def up
    create_table :tradedbooks do |t|
      t.string :username, null: false
      t.text :book_title, null: false
      t.column :created_at, :datetime
    end
    add_index :tradedbooks, :username
  end

  def down
    drop_table :tradedbooks
  end
end
