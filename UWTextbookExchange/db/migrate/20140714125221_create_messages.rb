class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
	t.string :sender, null: false
	t.string :receiver, null: false
	t.text :content, null:false
	t.column :created_at, :datetime
    end
  end

  def down
    drop_table :messages
  end
end
