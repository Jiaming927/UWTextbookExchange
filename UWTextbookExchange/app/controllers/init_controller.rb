class InitController < ApplicationController
 layout false 
 before_action :confirm_login, :except => [:signup, :attempt_signup, :attemp_login]
 
 def index
  end

  def signup
  	  if session[:user_id] && session[:username] && cookies[:username] && cookies[:firstname]
  	  	  redirect_to(:controller => 'init', :action => 'index')
  	  end
  end

  def attempt_signup
  	if !session[:user_id] || !session[:username] || !cookies[:username] || !cookies[:firstname]
	 	first_name = params[:newuser]["firstname"].strip
		last_name = params[:newuser]["lastname"].strip
		email1 = params[:newuser]["youremail"].strip
		email2 = params[:newuser]["reenteremail"].strip
		pswd1 = params[:newuser]["password"]
		pswd2 = params[:newuser]["reenterpassword"]
		chkbx = params[:newuser]["terms"]
		
		presentall = first_name.present? && last_name.present? && email1.present? && email2.present? && pswd1.present? && pswd2.present? && chkbx.present?
		if presentall		
			same = (email1 == email2) && (pswd1 == pswd2)

			validemail = /@uw.edu$/.match(email1)		

			validpswd = pswd1.bytesize >= 8 && pswd1.bytesize <= 20 && /[A-Z]/.match(pswd1) && /[a-z]/.match(pswd1) && /[0-9]/.match(pswd1)

			chk = (chkbx == '1')

			if presentall && same && validemail && validpswd && chk
				#success save to database
				redirect_to(:controller => 'init', :action => 'index')
			end
		end
		redirect_to(:controller => 'init', :action => 'signup')
	end
	redirect_to(:controller => 'init', :action => 'index')
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
                                        flash[:notice] = "Incorrect Username or Password"
                                else
						session[:username] = info.username
						session[:user_id] = info.id
						cookies[:username] = info.username
						cookies[:firstname] = info.first_name
                                end
                        else
                                flash[:notice] = "Incorrect Username or Password"
                        end
                else
                        flash[:notice] = "Missing Username or Password"
                end
                redirect_to(:controller => 'init', :action => 'index')
        end
        def confirm_login
                if session[:user_id] && session[:username] && cookies[:username] && cookies[:firstname]
                        flash[:login] = "Welcome, " + cookies[:firstname]
                end
                return true
        end

        def logout
		session.delete(:username)
		session.delete(:user_id)
		cookies.delete(:username)
		cookies.delete(:firstname)
		cookies.delete(:remember)
		cookies.delete(:last_input)
		flash[:login] = nil
                flash[:notice] = "Bye!"
                redirect_to(:controller => 'init', :action => 'index')
        end

end
