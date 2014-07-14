class InitController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:index, :terms]

 def index
 end

 def personal
	@Userbook = Userbooks.where(:email => current_user.email).first
	if !@Userbook
			@Userbook = Userbooks.new
			@Userbook.email = current_user.email
			if !@Userbook.save
				# database error
				return redirect_to(root_url)
			end
	end

	@Tradedbook = Usertraded.where(:email => current_user.email).first
	if !@Tradedbook
			@Tradedbook= Usertraded.new
			@Tradedbook.email = current_user.email
			if !@Tradedbook.save
				# database error
				return redirect_to(root_url)
			end
	end
 end

 def terms
 end

 def unlist
	if params[:book]
		bookname = params[:book].strip
		#delete from Userbook database
		@userbook_edit = Userbooks.where(:email => current_user.email).first
		index = nil
		if @userbook_edit
			for i in 1..@userbook_edit.own			
				owncolumn = "ownedbook" + i.to_s
				if @userbook_edit.read_attribute(owncolumn.to_sym) == bookname
					index = i
					break
				end
			end
			if index
				for i in index..(@userbook_edit.own-1)
					owncolumn = "ownedbook" + i.to_s
					nexcolumn = "ownedbook" + (i+1).to_s
					nextvalue = @userbook_edit.read_attribute(nexcolumn.to_sym)
					@userbook_edit.assign_attributes({owncolumn.to_sym => nextvalue})
				end
				lastcolumn = "ownedbook" + @userbook_edit.own.to_s
				@userbook_edit.assign_attributes({lastcolumn.to_sym => nil})
				@userbook_edit.own = @userbook_edit.own - 1
				if !@userbook_edit.save
					# database error
				end
			end
			
		end
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end

 def traded
	if params[:book]
		bookname = params[:book].strip

		#delete from userbook database
		@userbook_edit = Userbooks.where(:email => current_user.email).first
		index = nil
		if @userbook_edit
			for i in 1..@userbook_edit.own			
				owncolumn = "ownedbook" + i.to_s
				if @userbook_edit.read_attribute(owncolumn.to_sym) == bookname
					index = i
					break
				end
			end
			if index
				for i in index..(@userbook_edit.own-1)
					owncolumn = "ownedbook" + i.to_s
					nextcolumn = "ownedbook" + (i+1).to_s
					nextvalue = @userbook_edit.read_attribute(nextcolumn.to_sym)
					@userbook_edit.assign_attributes({owncolumn.to_sym => nextvalue})
				end
				lastcolumn = "ownedbook" + @userbook_edit.own.to_s
				@userbook_edit.assign_attributes({lastcolumn.to_sym => nil})
				@userbook_edit.own = @userbook_edit.own - 1
				if !@userbook_edit.save
					# database error
					return redirect_to('/personal')
				else
					# add to traded database
					@Tradedbook = Usertraded.where(:email => current_user.email).first
					if !@Tradedbook
						@Tradedbook= Usertraded.new
						@Tradedbook.email = current_user.email
					end
					@Tradedbook.traded = @Tradedbook.traded + 1
					tradecolumn = "tradedbook" + @Tradedbook.traded.to_s
					@Tradedbook.assign_attributes({tradecolumn.to_sym => bookname})
					if @Tradedbook.save
						#success
						flash[:editbookmessage] = bookname + " is posted successfully."
						return 	redirect_to('/personal')
					end
					# failed to redirect
					# retrieve database
					@userbook_edit.own = @userbook_edit.own + 1

					for i in @userbook_edit.own..(index+1)
						owncolumn = "ownedbook" + i.to_s
						prevcolumn = "ownedbook" + (i-1).to_s
						prevvalue = @userbook_edit.read_attribute(prevcolumn.to_sym)
						@userbook_edit.assign_attributes({owncolumn.to_sym => prevvalue})
					end
					thiscolumn = "ownedbook" + index
					@userbook_edit.assign_attributes({thiscolumn.to_sym => bookname})
					if !@userbook_edit.save
						# retrieve error
					end
				end
				
			end
		end
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end

end
