class CreateUserbooks < ActiveRecord::Migration
  def change
    create_table :userbooks do |t|
      t.string :email, null: false
      t.integer :own,  null: false, :default => 0
      t.integer :borrow,  null: false, :default => 0
#owned
      t.text :ownedbook1, limit: 100
      t.text :ownedbook2, limit: 100
      t.text :ownedbook3, limit: 100
      t.text :ownedbook4, limit: 100
      t.text :ownedbook5, limit: 100
      t.text :ownedbook6, limit: 100
      t.text :ownedbook7, limit: 100
      t.text :ownedbook8, limit: 100
      t.text :ownedbook9, limit: 100
      t.text :ownedbook10, limit: 100
      t.text :ownedbook11, limit: 100
      t.text :ownedbook12, limit: 100
      t.text :ownedbook13, limit: 100
      t.text :ownedbook14, limit: 100
      t.text :ownedbook15, limit: 100
#borrowed
      t.text :borrowedbook1, limit: 100
      t.text :borrowedbook2, limit: 100
      t.text :borrowedbook3, limit: 100
      t.text :borrowedbook4, limit: 100
      t.text :borrowedbook5, limit: 100
      t.text :borrowedbook6, limit: 100
      t.text :borrowedbook7, limit: 100
      t.text :borrowedbook8, limit: 100
      t.text :borrowedbook9, limit: 100
      t.text :borrowedbook10, limit: 100
      t.text :borrowedbook11, limit: 100
      t.text :borrowedbook12, limit: 100
      t.text :borrowedbook13, limit: 100
      t.text :borrowedbook14, limit: 100
      t.text :borrowedbook15, limit: 100

      t.timestamps
    end
  end
end
