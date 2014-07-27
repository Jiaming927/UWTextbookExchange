class Book < ActiveRecord::Base
   belongs_to :msgcount, :primary_key => "username", :foreign_key => :username
end
