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
      t.text :tradedbook16, limit: 100
      t.text :tradedbook17, limit: 100
      t.text :tradedbook18, limit: 100
      t.text :tradedbook19, limit: 100
      t.text :tradedbook20, limit: 100
      t.text :tradedbook21, limit: 100
      t.text :tradedbook22, limit: 100
      t.text :tradedbook23, limit: 100
      t.text :tradedbook24, limit: 100
      t.text :tradedbook25, limit: 100
      t.text :tradedbook26, limit: 100
      t.text :tradedbook27, limit: 100
      t.text :tradedbook28, limit: 100
      t.text :tradedbook29, limit: 100
      t.text :tradedbook30, limit: 100
      t.text :tradedbook31, limit: 100
      t.text :tradedbook32, limit: 100
      t.text :tradedbook33, limit: 100
      t.text :tradedbook34, limit: 100
      t.text :tradedbook35, limit: 100
      t.text :tradedbook36, limit: 100
      t.text :tradedbook37, limit: 100
      t.text :tradedbook38, limit: 100
      t.text :tradedbook39, limit: 100
      t.text :tradedbook40, limit: 100
      t.text :tradedbook41, limit: 100
      t.text :tradedbook42, limit: 100
      t.text :tradedbook43, limit: 100
      t.text :tradedbook44, limit: 100
      t.text :tradedbook45, limit: 100
      t.text :tradedbook46, limit: 100
      t.text :tradedbook47, limit: 100
      t.text :tradedbook48, limit: 100
      t.text :tradedbook49, limit: 100
      t.text :tradedbook50, limit: 100
      t.text :tradedbook51, limit: 100
      t.text :tradedbook52, limit: 100
      t.text :tradedbook53, limit: 100
      t.text :tradedbook54, limit: 100
      t.text :tradedbook55, limit: 100
      t.text :tradedbook56, limit: 100
      t.text :tradedbook57, limit: 100
      t.text :tradedbook58, limit: 100
      t.text :tradedbook59, limit: 100
      t.text :tradedbook60, limit: 100
      t.text :tradedbook61, limit: 100
      t.text :tradedbook62, limit: 100
      t.text :tradedbook63, limit: 100
      t.text :tradedbook64, limit: 100
      t.text :tradedbook65, limit: 100
      t.text :tradedbook66, limit: 100
      t.text :tradedbook67, limit: 100
      t.text :tradedbook68, limit: 100
      t.text :tradedbook69, limit: 100
      t.text :tradedbook70, limit: 100
      t.text :tradedbook71, limit: 100
      t.text :tradedbook72, limit: 100
      t.text :tradedbook73, limit: 100
      t.text :tradedbook74, limit: 100
      t.text :tradedbook75, limit: 100
      t.text :tradedbook76, limit: 100
      t.text :tradedbook77, limit: 100
      t.text :tradedbook78, limit: 100
      t.text :tradedbook79, limit: 100
      t.text :tradedbook80, limit: 100
      t.text :tradedbook81, limit: 100
      t.text :tradedbook82, limit: 100
      t.text :tradedbook83, limit: 100
      t.text :tradedbook84, limit: 100
      t.text :tradedbook85, limit: 100
      t.text :tradedbook86, limit: 100
      t.text :tradedbook87, limit: 100
      t.text :tradedbook88, limit: 100
      t.text :tradedbook89, limit: 100
      t.text :tradedbook90, limit: 100
      t.text :tradedbook91, limit: 100
      t.text :tradedbook92, limit: 100
      t.text :tradedbook93, limit: 100
      t.text :tradedbook94, limit: 100
      t.text :tradedbook95, limit: 100
      t.text :tradedbook96, limit: 100
      t.text :tradedbook97, limit: 100
      t.text :tradedbook98, limit: 100
      t.text :tradedbook99, limit: 100
      t.text :tradedbook100, limit: 100

      t.timestamps
    end
  end

  def down
    drop_table :usertradeds
  end
end
