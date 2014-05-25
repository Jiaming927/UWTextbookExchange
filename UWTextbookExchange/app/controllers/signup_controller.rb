class SignupController < ApplicationController
	def attempt_signup
		if params[:username].present? && params[password].present? && params[:email].present?
			&& params[:user_id]
			@info = User.where(:username => params[:username]).first
			if !info
				@newUser = User.new
				@newUser.first_name = params[first_name]
				@newUser.last_name = params[last_name]
				@newUser.email = params[email]
				@newUser.password = params[password]
				@newUser.book_number = "0"
				@newUser.saved
				render :json => { error: false message: "Success!"}
			else 
				render :json => { error: true, message: "Username taken" }
			end
		else 
			render :json => { error: true, message: "Not enough info given" }
	end
end
