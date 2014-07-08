class GetBookController < ApplicationController
 layout false 
  before_filter :authenticate_user!, :except => [:find]
  def find
	if params[:post]
	    	 flash[:notice] = params[:course]["department"]
		redirect_to(:action => 'post')
	else
		cookies[:last_dep] = params[:course]["department"]
		cookies[:last_class] = params[:course]["class"]	
		@courseName = params[:course]["department"].upcase
		@courseName <<  params[:course]["class"]
	
		@courseInfo = Course.where(:course_name => courseName).first
		if !@courseInfo
		   flash[:notice] = "Oops.. Misspell anything?"
		  redirect_to(:controller => 'init', :action =>'index')
		end
	end
  end

  def post
		cookies[:last_dep] = params[:course]["department"]
		cookies[:last_class] = params[:course]["class"]	
		@courseName = params[:course]["department"].upcase
		@courseName <<  params[:course]["class"]
	
		@courseInfo = Course.where(:course_name => courseName).first
		if !@courseInfo
		   flash[:notice] = "Oops.. Misspell anything?"
		  redirect_to(:controller => 'init', :action =>'index')
		end
  end

  def postto
	
  end
end
