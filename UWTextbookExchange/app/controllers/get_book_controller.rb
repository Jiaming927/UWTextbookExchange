class GetBookController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:find]
  def find
	session[:last_dep] = params[:course]["department"].strip
	session[:last_class] = params[:course]["class"].strip
	@courseName = params[:course]["department"].strip.upcase
	@courseName <<  params[:course]["class"].strip

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
  end

  def post
	@courseName = session[:last_dep].strip.upcase
	@courseName <<  session[:last_class].strip
	@courseInfo = Course.where(:course_name => @courseName).first
	if !@courseInfo
	  flash[:notice] = "Oops.. Misspell anything?"
	  redirect_to(:controller => 'init', :action =>'index')
	end
  end

  def postto
	if params[:course] && params[:book]
		course = params[:course].strip
		bookname = params[:book].strip
		flash[:notice] = course + " " + bookname + " posted!"
	end
	redirect_to(:controller => 'init', :action =>'index')
  end
end
