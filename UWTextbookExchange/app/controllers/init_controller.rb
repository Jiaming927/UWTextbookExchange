class InitController < ApplicationController
 layout false 
 before_action :confirm_login, :except => [:signup, :attempt_signup, :attemp_login]
 
 def index
  end

  def signup	
  end

  def attempt_signup
	
  end


        def attempt_login
		if params[:user]["remember"] == '1'
			cookies[:last_input] =  {:value => params[:user]["username"], :expires => 7.day.from_now}
			cookies[:remember] = params[:user]["remember"]
		else
			cookies.delete(:remember)
			cookies.delete(:last_input)
			cookies[:last_input] = params[:user]["username"]
		end
                if params[:user]["username"].present? && params[:user]["password"].present?
                        temp = User.where(:username =>params[:user]["username"]).first
                        if temp
                                info = temp.authenticate(params[:user]["password"])
                                if !info
                                        flash[:notice] = "Wrong username or password"
                                else
					session[:username] = info.username
                                        session[:user_id] = info.id
                                       	cookies[:username] = info.username
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
                        flash[:login] = cookies[:username]

                else
                        flash[:login] = "Not yet login"
                end
                return true
        end

        def logout
		session.delete(:username)
		session.delete(:user_id)
		cookies.delete(:username)
                flash[:notice] = "Good Bye"
                redirect_to(:controller => 'init', :action => 'index')
        end

end
