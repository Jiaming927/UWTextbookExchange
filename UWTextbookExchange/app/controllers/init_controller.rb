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
					nextcolumn = "ownedbook" + (i+1).to_s
					nextvalue = @userbook_edit.read_attribute(nextcolumn.to_sym)
					@userbook_edit.assign_attributes({owncolumn.to_sym => nextvalue})
				end
				lastcolumn = "ownedbook" + @userbook_edit.own.to_s
				@userbook_edit.assign_attributes({lastcolumn.to_sym => nil})
				@userbook_edit.own = @userbook_edit.own - 1
				
				if @userbook_edit.save
					delete_from_user(bookname)					
				else
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
					if @Tradedbook.save && delete_from_user(bookname)
						#success						
						flash[:editbookmessage] = bookname + " is successfully traded."
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

 def resume
	if params[:book]
		bookname = params[:book].strip
		@Userbook = Userbooks.where(:email => current_user.email).first
		if @Userbook.own != 15
			#delete from Usertraded database
			@Tradedbook = Usertraded.where(:email => current_user.email).first
			index = nil
			if @Tradedbook
				for i in 1..@Tradedbook.traded			
					thiscolumn = "tradedbook" + i.to_s
					if @Tradedbook.read_attribute(thiscolumn.to_sym) == bookname
						index = i
						break
					end
				end
				if index
					for i in index..(@Tradedbook.traded-1)
						owncolumn = "tradedbook" + i.to_s
						nextcolumn = "tradedbook" + (i+1).to_s
						nextvalue = @Tradedbook.read_attribute(nextcolumn.to_sym)
						@Tradedbook.assign_attributes({owncolumn.to_sym => nextvalue})
					end
					lastcolumn = "tradedbook" + @Tradedbook.traded.to_s
					@Tradedbook.assign_attributes({lastcolumn.to_sym => nil})
					@Tradedbook.traded = @Tradedbook.traded - 1
					if !@Tradedbook.save
						# database error
						return redirect_to('/personal')
					else
						# add to Userbooks database						
						if !@Userbook
							@Userbook= Userbooks.new
							@Userbook.email = current_user.email
						end
						@Userbook.own = @Userbook.own + 1
						usercolumn = "ownedbook" + @Userbook.own.to_s
						@Userbook.assign_attributes({usercolumn.to_sym => bookname})
						if @Userbook.save && add_to_user(bookname)
							#success						
							flash[:editbookmessage] = bookname + " is back on sale."
							return 	redirect_to('/personal')
						end
						# failed to redirect
						# retrieve database
						@Tradedbook.traded = @Tradedbook.traded + 1

						for i in @Tradedbook.traded..(index+1)
							thiscolumn = "tradedbook" + i.to_s
							prevcolumn = "tradedbook" + (i-1).to_s
							prevvalue = @Tradedbook.read_attribute(prevcolumn.to_sym)
							@Tradedbook.assign_attributes({thiscolumn.to_sym => prevvalue})
						end
						thiscolumn = "tradedbook" + index
						@Tradedbook.assign_attributes({thiscolumn.to_sym => bookname})
						if !@Tradedbook.save
							# retrieve error
						end
					end
					
				end
			end
		else
			flash[:editbookmessage] = "You cannot post more than 15 books. Please unlist some of them"
		end
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end

 def delete
	if params[:book]
		bookname = params[:book].strip
		#delete from Tradedbook database
		@Tradedbook = Usertraded.where(:email => current_user.email).first
		index = nil
		if @Tradedbook
			for i in 1..@Tradedbook.traded			
				thiscolumn = "tradedbook" + i.to_s
				if @Tradedbook.read_attribute(thiscolumn.to_sym) == bookname
					index = i
					break
				end
			end
			if index
				for i in index..(@Tradedbook.traded-1)
					thiscolumn = "tradedbook" + i.to_s
					nextcolumn = "tradedbook" + (i+1).to_s
					nextvalue = @Tradedbook.read_attribute(nextcolumn.to_sym)
					@Tradedbook.assign_attributes({thiscolumn.to_sym => nextvalue})
				end
				lastcolumn = "tradedbook" + @Tradedbook.traded.to_s
				@Tradedbook.assign_attributes({lastcolumn.to_sym => nil})
				@Tradedbook.traded = @Tradedbook.traded - 1
				if !@Tradedbook.save
					# database error
				end
			end
			
		end
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end

 def delete_from_user(bookname)
	@book = Book.where(:book_title => bookname).first
	if @book
		index = nil
		for i in 1..@book.number
			thiscolumn = "user" + i.to_s
			if @book.read_attribute(thiscolumn.to_sym) == current_user.email
				index = i
				break
			end
		end
		if index
			for i in index..(@book.number-1)
				thiscolumn = "user" + i.to_s
				nextcolumn = "user" + (i+1).to_s
				nextvalue = @book.read_attribute(nextcolumn.to_sym)
				@book.assign_attributes({thiscolumn.to_sym => nextvalue})
			end
			lastcolumn = "user" + @book.number.to_s
			@book.assign_attributes({lastcolumn.to_sym => nil})
			@book.number = @book.number - 1
			return @book.save
		end
	end
	return @book
 end
 
 def add_to_user(bookname)
	@book = Book.where(:book_title => bookname).first
	if @book
		if @book.number == 500
			#overflow
			@book.number = @book.number - 1
			for i in 1..499
				prevcolumn = "user" + i.to_s
				nextcolumn = "user" + (i+1).to_s
				nextvalue = @book.read_attribute(nextcolumn.to_sym)
				@book.assign_attributes({prevcolumn.to_sym => nextvalue})
			end
			@book.assign_attributes({:user500 => nil})
		end

		@book.number = @book.number + 1
		@usercolumn = "user" + @book.number.to_s
		@book.assign_attributes({@usercolumn.to_sym => current_user.email})
		return @book.save
	end
	return @book
 end

end
