class GetBookController < ApplicationController
  def create
  end

  def read
	@course = CourseToBook.new
	if params[:post]
	    redirect_to(:action => 'update')
	end	
  end

  def update
	@course = CourseToBook.new
  end

  def delete
  end
end
