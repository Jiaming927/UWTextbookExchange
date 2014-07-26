class CreateBookinfos < ActiveRecord::Migration
  def up
    create_table :bookinfos do |t|
      t.text :book_title, null: false
      t.string :author, limit:50
      t.decimal :price
      t.string :course_name, null: false, limit:20
      t.integer :number, :default => 0, null: false
    end
    add_index :bookinfos, :book_title, unique: true
  end

  def down
    drop_table :bookinfos
  end
end
