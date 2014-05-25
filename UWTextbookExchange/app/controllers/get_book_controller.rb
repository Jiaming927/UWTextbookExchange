class GetBookController < ApplicationController
  def create
  end

  def read
	#@course = CourseToBook.new
	if params[:post]
	    	 flash[:notice] = params[:course]["department"]
		redirect_to(:action => 'update')
	end
	
	courseName = params[:course]["department"]
	courseName <<  params[:course]["class"]
	
	@courseInfo = CourseToBook.where(:course => courseName).first
	if !@courseInfo
	   flash[:notice] = "no book found, check  your input"
	  redirect_to(:controller => 'init', :action =>'index')
	end
  end

  def update
	@course = CourseToBook.new
  end

  def delete
  end
end
