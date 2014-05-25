class CreateCourseToBooks < ActiveRecord::Migration
  def change
    create_table :course_to_books do |t|
      t.string :course
      t.text :book1
      t.text :book2
      t.text :book3
      t.text :book4
      t.text :book5

      t.timestamps
    end
  end
end
