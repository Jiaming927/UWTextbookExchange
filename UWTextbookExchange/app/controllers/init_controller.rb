class InitController < ApplicationController
 layout false 
 before_action :confirm_login
 
 def index
  end

  def create
	#@test = User.new(:first_name => "testtest", :last_name => "testtest", :email => "test@uw.edu")
      #@test.save 
  end

        def attempt_login
#       @success = nil
                if params[:user]["username"].present? && params[:user]["password"].present?
                        temp = User.where(:username =>params[:user]["username"]).first
                        if temp
                                info = temp.authenticate(params[:user]["password"])
                                if !info
                                        flash[:notice] = "Wrong username or password"
                                else
                                #       @success = true                                   
				#	flash[:login] = info.username
                                        session[:username] = info.username
                                        session[:user_id] = info.id
                                        cookies[:username] = info.username
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
                        flash[:login] = cookies[:username]

                else
                        flash[:login] = "Not yet login"
                end
                return true
        end

        def logout
                #session[:username] = nil
		session.delete(:username)
		session.delete(:user_id)
		cookies.delete(:username)
                flash[:notice] = "Good Bye"
                redirect_to(:controller => 'init', :action => 'index')
        end

end
