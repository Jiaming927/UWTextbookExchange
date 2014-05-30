class AuthController < ApplicationController
#	skip_before_filter :verify_authenticity_token
	before_action :confirm_login
	def attempt_login
#	@success = nil		
		if params[:user]["username"].present? && params[:user]["password"].present?
			temp = User.where(:username =>params[:user]["username"]).first
		    	if temp	
				info = temp.authenticate(params[:user]["password"])
				if !info
					flash[:notice] = "Wrong username or password"
				else
				#	@success = true
					flash[:notice] = info["name"]
					session[:username] = info["name"] 
					session[:user_id] = info["id"]
					cookies[:username] = info["name"]
					#redirect_to(:controller => 'init', :action => 'index')
				end
			else
				flash[:notice] = "Wrong username or password"
		   	end
		else
			flash[:notice] = "Missing important field!"
		end
		redirect_to(:controller => 'init', :action => 'index')
	end

	def confirm_login
		if session[:user_id] && session[:username] && cookies[:username]
			flash[:notice] = cookies[:username]
		
		else
			flash[:notice] = "Not yet login"
		end
		return true
	end

	def logout
		session[:username] = nil
		flash[:notice] = "Good BYE"
		redirect_to(:controller => 'init', :action => 'index')
	end
end
