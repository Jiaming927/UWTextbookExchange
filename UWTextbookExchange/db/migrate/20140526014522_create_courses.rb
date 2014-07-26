class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :course_name, null: false, limit:20
      t.integer :number, null: false, :default => 0
      t.text :book1
      t.text :book2
      t.text :book3
      t.text :book4
      t.text :book5
      t.text :book6
      t.text :book7
      t.text :book8
      t.text :book9
      t.text :book10
      t.text :book11
      t.text :book12
      t.text :book13
      t.text :book14
      t.text :book15
    end
	add_index :courses, :course_name, unique: true
  end

  def down
    drop_table :courses
  end
end
