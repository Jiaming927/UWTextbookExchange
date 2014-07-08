class InitController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:index]

 def index
 end

 def personal
 end
end
