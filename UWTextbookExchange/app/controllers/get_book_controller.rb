class GetBookController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:find, :show]
  def find
	if params["coursename"]
		session[:coursename] = params["coursename"]
		@courseName = params["coursename"].strip.upcase
		@courseInfo = Course.where(:course_name => @courseName).first
		if !@courseInfo
		  flash[:notice] = "Oops.. Misspell anything?"
		  redirect_to(:controller => 'init', :action =>'index')
		end
	elsif params[:course]
		session[:last_dep] = params[:course]["department"].strip
		session[:last_class] = params[:course]["class"].strip
		@courseName = params[:course]["department"].strip.upcase
		@courseName <<  params[:course]["class"].strip
		session[:coursename] = @courseName

		if params[:post]
		    	 flash[:notice] = params[:course]["department"]
			redirect_to(:action => 'post')
		else	
			@courseInfo = Course.where(:course_name => @courseName).first
			if !@courseInfo
			  flash[:notice] = "Oops.. Misspell anything?"
			  redirect_to(:controller => 'init', :action =>'index')
			end
		end
	else
		redirect_to(:controller => 'init', :action =>'index')
	end
  end

  def show
	if params[:book]
		@showbookname = params[:book].strip
		@bookinfo = Book.where(:book_title => @showbookname).first
	else
		redirect_to(:controller => 'init', :action =>'index')
	end
  end

  def post
	if session[:coursename]
		@courseInfo = Course.where(:course_name => session[:coursename]).first
		if !@courseInfo
		  flash[:notice] = "Oops.. Misspell anything?"
		  redirect_to(:controller => 'init', :action =>'index')
		end
	end
  end

  def postto
	if params[:course] && params[:book]
		course = params[:course].strip
		bookname = params[:book].strip

		#update userbook
		@userbook_edit = Userbooks.where(:email => current_user.email).first
		exist = nil
		if !@userbook_edit
			#userbook record not exist
			@userbook_edit = Userbooks.new
			@userbook_edit.email = current_user.email
		else
			#record exist
			# test if the book already exist in the record
			for i in 1..@userbook_edit.own			
				owncolumn = "ownedbook" + i.to_s
				if @userbook_edit.read_attribute(owncolumn.to_sym) == bookname.strip
					exist = 1;
				end
			end
		end
		
		if !exist
			@userbook_edit.own = @userbook_edit.own + 1
			@userbookcolumn = "ownedbook" + @userbook_edit.own.to_s
			@userbook_edit.assign_attributes({@userbookcolumn.to_sym => bookname})
			if @userbook_edit.save
				# update books
				@book_edit = Book.where(:book_title => bookname).first
				if !@book_edit
					#book not exist
					@book_edit = Book.new
					@book_edit.book_title = bookname
					@book_edit.course_name = course
				end
				@book_edit.number = @book_edit.number + 1
				@usercolumn = "user" + @book_edit.number.to_s
				@book_edit.assign_attributes({@usercolumn.to_sym => current_user.email})
				if @book_edit.save
					#success
					flash[:postmessage] = bookname + " is posted successfully."
					return 	redirect_to(:controller => 'GetBook', :action =>'post')
				end

				# failed to redirect
				# retrieve database
				@userbook_edit.own = @userbook_edit.own - 1
				@userbook_edit.assign_attributes({userbookcolumn.to_sym => nil})
				if !@userbook_edit.save
					# retrieve error
				end
			end
			flash[:postmessage] = "Error occurs. We are working on it right now. Sorry for the inconvenience."
		else
			flash[:postmessage] = "You have already had that book."
		end
	end	
	redirect_to(:controller => 'GetBook', :action =>'post')
  end
end
