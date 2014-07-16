class CreateChannels < ActiveRecord::Migration
  def up
    create_table :channels do |t|
	t.string :channel_name, null: false
	t.integer :total_message, default: 0, null: false
	t.integer :first_side, default: 0, null: false
	t.integer :second_side, default: 0, null: false
    end
	add_index :channels, :channel_name, unique: true
  end
  def down
    drop_table :channels
  end
end
