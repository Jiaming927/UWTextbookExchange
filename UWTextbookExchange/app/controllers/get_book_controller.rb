class GetBookController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:find, :show]
  def find
	if params["coursename"]
		session[:coursename] = params["coursename"]
		courseName = params["coursename"].strip.upcase
		@course = Course.where(:course_name => courseName).first
		if !@course
		  flash[:notice] = "This course is not held in this quarter, or misspell anything?"
		  return redirect_to(root_url)
		end
		createInfo(@course)
		messagehelper
	elsif params[:course]
		session[:last_dep] = params[:course]["department"].strip
		session[:last_class] = params[:course]["class"].strip
		courseName = params[:course]["department"].strip.upcase
		courseName <<  params[:course]["class"].strip
		session[:coursename] = courseName

		if params[:post]
		    	flash[:notice] = params[:course]["department"]
			return redirect_to('/post')
		else	
			@course = Course.where(:course_name => courseName).first
			if !@course
			  flash[:notice] = "This course is not held in this quarter, or misspell anything?"
			  return redirect_to(root_url)
			end
		end
		createInfo(@course)
		messagehelper
	else
		redirect_to(root_url)
	end
  end

  def show
	if params[:book]
		@book = Book.where(:book_title => params[:book].strip)
		@bookinfo = Bookinfo.where(:book_title => params[:book].strip).first
		messagehelper
	else
		redirect_to(root_url)
	end
  end

  def postto
	if params[:book]
		bookname = params[:book].strip
		#if book in bookinfo
		binfo = Bookinfo.where(:book_title => bookname).first
		if binfo
			coursename = binfo.course_name
			#increment bookinfo
			binfo.number = binfo.number + 1
			if binfo.save
				#add to book
				Book.create(:book_title => bookname, :username => current_user.username)

				#add to owned
				Ownedbook.create(:book_title => bookname, :username => current_user.username)
				flash[:postmessage] = bookname + " is posted successfully"
				return redirect_to('/post')
			end
		end
	end
	redirect_to(root_url)
  end

  def post
	if session[:coursename]
		@course = Course.where(:course_name => session[:coursename]).first
		if !@course
		  flash[:notice] = "This course is not held in this quarter, or misspell anything?"
		  return redirect_to(root_url)
		end
		createInfo(@course)
		messagehelper
	else
		redirect_to(root_url)
	end
  end

private
    def messagehelper
	if user_signed_in?
		@msgc = Msgcount.where(:username => current_user.username).first
	end
    end

    def createInfo(course)
	course.attributes.each do |attr_name, attr_value|
		if attr_name != "id" && attr_name != "course_name" && attr_name != "number" && attr_value != nil %>
			binfo = Bookinfo.where(:book_title => attr_value).first
			if !binfo
				Bookinfo.create(:book_title => attr_value, :course_name => course.course_name)
			end
		end
	end
    end
end
