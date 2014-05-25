class InitController < ApplicationController
  def index
  end

  def create
	@test = User.new(:first_name => "testtest", :last_name => "testtest", :email => "test@uw.edu")
  	@test.save  	
  end
end
