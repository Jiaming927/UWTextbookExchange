class Msgcount < ActiveRecord::Base

  has_many :books, :primary_key => "username", :foreign_key => :username

	before_create {
		self.last_update = Time.now		
	}

  default_scope {order("last_update DESC")}

end
