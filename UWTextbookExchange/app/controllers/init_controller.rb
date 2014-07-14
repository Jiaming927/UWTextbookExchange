class InitController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:index, :terms]

 def index
 end

 def personal
	@Userbook = Userbooks.where(:email => current_user.email).first
	if !@Userbook
			@Userbook = Userbooks.new
			@Userbook.email = current_user.email
			if !@Userbook.save
				# database error
				redirect_to(root_url)
			end
	end
 end

 def terms
 end

end
