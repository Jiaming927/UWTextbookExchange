class CreateNewbooks < ActiveRecord::Migration
  def up
    create_table :newbooks do |t|
      t.text :book_title, null: false
      t.string :author, limit:50
      t.decimal :price
      t.string :course_name, null: false
      t.string :email,           null:false, default: ""
      t.boolean :reviewed,       null:false, default: false
      t.boolean :passed
      t.timestamps
    end
    add_index :newbooks, :book_title, unique: true
  end

  def down
    drop_table :newbooks
  end
end
