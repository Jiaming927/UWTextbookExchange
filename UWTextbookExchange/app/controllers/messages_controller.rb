class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
	if params[:receiver] && !params[:receiver].blank? && params[:receiver].strip != current_user.username && user_exist_create(params[:receiver].strip)
		@channel = return_asc(current_user.username, params[:receiver].strip)
		@messages = Message.where("(sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?)", current_user.username,params[:receiver].strip,params[:receiver].strip, current_user.username)
	else
		redirect_to(root_url)
	end
  end

  def create
	if params[:message] && params[:message][:sender] && params[:message][:receiver] && params[:message][:content] && !params[:message][:sender].blank? && !params[:message][:receiver].blank? && !params[:message][:content].blank? && params[:message][:sender].blank? != params[:message][:receiver]
		@message = Message.create!(params[:message].permit(:content, :sender, :receiver))		
		chnl = return_asc(params[:message][:sender].strip, params[:message][:receiver].strip)
		PrivatePub.publish_to("/messages/" + chnl, message: @message)
	else
		redirect_to(root_url)
	end
  end

private
  
    def user_exist_create(send_to_user)
	if !Msgcount.where(:username => current_user.username).first
		msg = Msgcount.new
		msg.username = current_user.username
		if !msg.save
			#save failed
			return false
		end
	end
	if !Msgcount.where(:username => send_to_user).first
		if !User.where(:username => send_to_user).first
			return false
		else
			#user exist
			msg = Msgcount.new
			msg.username = send_to_user
			if !msg.save
				#save failed
				return false
			end
		end			
	end
	
	return true
    end

    # return two string in alphabetic order
    # used to create channel name
    def return_asc(a, b)
	return (a<b ? (a+b) : (b+a))
    end
end
