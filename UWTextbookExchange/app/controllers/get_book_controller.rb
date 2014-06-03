class GetBookController < ApplicationController
 layout false 
 def create
  end

  def read
	if params[:post]
	    	 flash[:notice] = params[:course]["department"]
		redirect_to(:action => 'update')
	else
		cookies[:last_dep] = params[:course]["department"]
		cookies[:last_class] = params[:course]["class"]	
		courseName = params[:course]["department"].upcase
		courseName <<  params[:course]["class"]
	
		@courseInfo = Course.where(:course_name => courseName).first
		if !@courseInfo
		   flash[:notice] = "Oops.. Misspell anything?"
		  redirect_to(:controller => 'init', :action =>'index')
		end
	end
  end

  def update
	
  end

  def delete
  end
end
