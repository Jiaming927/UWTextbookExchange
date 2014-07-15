class CreateMsgcounts < ActiveRecord::Migration
  def up
    create_table :msgcounts do |t|
	t.string :username
	t.integer :count, default: 0, null: false
	t.integer :unread, default: 0, null: false
    end
	add_index :msgcounts, :username, unique: true
  end

  def down
    drop_table :msgcounts
  end
end
