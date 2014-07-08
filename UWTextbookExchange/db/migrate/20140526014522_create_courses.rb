class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :course_name, null: false, limit:20
      t.integer :number, null: false, :default => 0
      t.text :book1, limit: 100
      t.text :book2, limit: 100
      t.text :book3, limit: 100
      t.text :book4, limit: 100
      t.text :book5, limit: 100
      t.text :book6, limit: 100
      t.text :book7, limit: 100
      t.text :book8, limit: 100
      t.text :book9, limit: 100
      t.text :book10, limit: 100
      t.text :book11, limit: 100
      t.text :book12, limit: 100
      t.text :book13, limit: 100
      t.text :book14, limit: 100
      t.text :book15, limit: 100

      t.timestamps
    end
  end

  def down
    drop_table :courses
  end
end
