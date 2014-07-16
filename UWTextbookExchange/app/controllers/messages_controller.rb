class MessagesController < ApplicationController
  before_filter :authenticate_user!

# Channel model
# first_side message 'first' sent that 'second' hasn't read
# second_side message 'second' send that 'first' hasn't read

  def index
	if params[:receiver] && !params[:receiver].blank? && params[:receiver].strip != current_user.username && user_exist_create(params[:receiver].strip)
		@channel = return_asc(current_user.username, params[:receiver].strip)
		if user_channel_exist(@channel)
			ch = Channel.where(:channel_name => @channel).first
			if ch
				if is_small(current_user.username, params[:receiver].strip)
					@msg_number = ch.second_side
					#mark msg from other side to read
					ch.second_side = 0
				else
					@msg_number = ch.first_side
					#mark msg from other side to read
					ch.first_side = 0
				end
				msgc_db = Msgcount.where(:username => current_user.username).first
				if msgc_db
					msgc_db.unread = msgc_db.unread - @msg_number
					if msgc_db.save
						if ch.save
							@messages = Message.where("(sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?)", current_user.username,params[:receiver].strip,params[:receiver].strip, current_user.username)
						else
							#database error
							#retrieve database
							msgc_db.unread = msgc_db.unread + @msg_number
							msgc_db.save
							return database_error
						end
					else
						return database_error
					end
				else
					return database_error
				end
			else
				return database_error
			end
		else
			return database_error
		end
	else
		redirect_to('/chatlist')
	end
  end

  def create
	if params[:message] && params[:message][:sender] && params[:message][:receiver] && params[:message][:content] && !params[:message][:sender].blank? && !params[:message][:receiver].blank? && !params[:message][:content].blank? && user_exist_create(params[:message][:receiver].strip) && params[:message][:sender].blank? != params[:message][:receiver]
		@message = Message.create!(params[:message].permit(:content, :sender, :receiver))		
		chnl = return_asc(current_user.username, params[:message][:receiver].strip)
		PrivatePub.publish_to("/messages/" + chnl, message: @message)
		chnl_db = Channel.where(:channel_name => chnl).first
		if chnl_db
			#increment total in channel db
			chnl_db.total_message = chnl_db.total_message + 1
			if is_small(current_user.username, params[:message][:receiver].strip)
				#increment self-count in channel db
				chnl_db.first_side = chnl_db.first_side + 1
				#mark msg from other side to read
				@msg_number = chnl_db.second_side
				chnl_db.second_side = 0
			else
				#increment self-count in channel db
				chnl_db.second_side = chnl_db.second_side + 1
				#mark msg from other side to read
				@msg_number = chnl_db.first_side
				chnl_db.first_side = 0
			end
			chnl_db.save
			msgc_db = Msgcount.where(:username => current_user.username).first
			if msgc_db
				#set unread number in msgcount db
				msgc_db.unread = msgc_db.unread - @msg_number
				#increment self-count in channel db
				msgc_db.count = msgc_db.count + 1
				msgc_db.save

				#add unread to other user
				msgc_other_db = Msgcount.where(:username => params[:message][:receiver].strip).first
				if msgc_other_db
					msgc_other_db.unread = msgc_other_db.unread + 1
					if !msgc_other_db.save
						return database_error
					end
				else
					return database_error
				end
			else
				return database_error
			end
		else
			return database_error
		end


	else
		redirect_to('/chatlist')
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
			#receiver not exist
			flash[:notice] = "The user does not exist."
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

    def user_channel_exist(channel)
	if !Channel.where(:channel_name => channel).first
		ch = Channel.new
		ch.channel_name = channel
		if !ch.save
			return false
		end
	end
	return true
    end

    # return two string in alphabetic order
    # used to create channel name
    def return_asc(a, b)
	return (a<b ? (a+b) : (b+a))
    end

    def is_small(a, b)
	return (a<b ? true : false)
    end

    def database_error
	flash[:notice] = "Something has gone wrong. We are trying to fix it."
	return redirect_to('/chatlist')
    end
end