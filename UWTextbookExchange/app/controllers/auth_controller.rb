class AuthController < ApplicationController

	def attempt_login
		if params[:username].present? && params[password].present?
			@info = User.where(:username => params[:username]).first
			if @info.authenticate(params[:password])
				session[:username] = params[:username]
				session[:user_id] = @info.id
			else
				flash[:notice] = "SHA BI"
			end
		redirect_to (:controller => 'init', :action => 'index')
	end
		
	def logout
		session[:username] = nil
		flash[:notice] = "Good BYE"
		redirect_to (:controller => 'init', :action => 'index')
	end
end
