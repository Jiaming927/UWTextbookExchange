class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :course_name, null: false, limit:20
      t.text :book1, limit: 100
      t.text :book2, limit: 100
      t.text :book3, limit: 100
      t.text :book4, limit: 100
      t.text :book5, limit: 100
      t.timestamps
    end
  end

  def down
    drop_table :courses
  end
end
