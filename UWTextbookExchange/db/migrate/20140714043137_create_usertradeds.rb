class CreateUsertradeds < ActiveRecord::Migration
  def up
    create_table :usertradeds do |t|
      t.string :email, null: false
      t.integer :traded,  null: false, :default => 0
#traded
      t.text :tradedbook1, limit: 100
      t.text :tradedbook2, limit: 100
      t.text :tradedbook3, limit: 100
      t.text :tradedbook4, limit: 100
      t.text :tradedbook5, limit: 100
      t.text :tradedbook6, limit: 100
      t.text :tradedbook7, limit: 100
      t.text :tradedbook8, limit: 100
      t.text :tradedbook9, limit: 100
      t.text :tradedbook10, limit: 100
      t.text :tradedbook11, limit: 100
      t.text :tradedbook12, limit: 100
      t.text :tradedbook13, limit: 100
      t.text :tradedbook14, limit: 100
      t.text :tradedbook15, limit: 100

      t.timestamps
    end
  end

  def down
    drop_table :usertradeds
  end
end
