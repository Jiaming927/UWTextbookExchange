class InitController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:index, :terms]

 def index
	if user_signed_in?
		@msgc = Msgcount.where(:username => current_user.username).first
		if !@msgc
			Msgcount.create(:username => current_user.username)
		end
	end
 end

 def chatlist
	@msgc = Msgcount.where(:username => current_user.username).first
	@chnls = Channel.where("channel_name LIKE ? OR channel_name LIKE ?", current_user.username + "%", "%" + current_user.username)
 end

 def showcount
	msgc = Msgcount.where(:username => current_user.username).first
	if msgc
		msgc.updated_at = Time.now
		msgc.save
		render :text => msgc.unread
	else
		render :text => "0"
	end
 end

 def personal
	@msgc = Msgcount.where(:username => current_user.username).first
	@Ownedbook = Ownedbook.where(:username => current_user.username)
	@Tradedbook = Tradedbook.where(:username => current_user.username)
 end

 def terms
 end

 def unlist
	if params[:book]
		bookname = params[:book].strip

		#if book exist
		binfo = Bookinfo.where(:book_title => bookname).first
		if binfo
			#remove from owned
			ob = Ownedbook.where(:username => current_user.username, :book_title => bookname).first
			if ob
				ob.destroy

				#decrement number
				binfo.number = binfo.number - 1
				binfo.save

				#remove from book
				bk = Book.where(:username => current_user.username, :book_title => bookname).first
				if bk
					bk.destroy
				end
			else
				return redirect_to(root_url)
			end

		else
			return redirect_to(root_url)
		end
		flash[:editbookmessage] = bookname + " is unlisted"
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end

 def traded
	if params[:book]
		bookname = params[:book].strip

		#if book exist
		binfo = Bookinfo.where(:book_title => bookname).first
		if binfo
			#remove from owned
			ob = Ownedbook.where(:username => current_user.username, :book_title => bookname).first
			if ob
				ob.destroy

				#decrement number
				binfo.number = binfo.number - 1
				binfo.save

				#remove from book
				bk = Book.where(:username => current_user.username, :book_title => bookname).first
				if bk
					bk.destroy
				end

				#add to traded
				Tradedbook.create(:username => current_user.username, :book_title => bookname)
			else
				return redirect_to(root_url)
			end
		else
			return redirect_to(root_url)
		end
		flash[:editbookmessage] = bookname + " is successfully traded"
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end

 def resume
	if params[:book]
		bookname = params[:book].strip

		#if book exist
		binfo = Bookinfo.where(:book_title => bookname).first
		if binfo
			#if the user already post the book
			bk = Book.where(:username => current_user.username, :book_title => bookname).first
			if bk
				flash[:editbookmessage] = "You have already posted the book"
				return redirect_to('/personal')
			else
				#remove from traded
				tb = Tradedbook.where(:username => current_user.username, :book_title => bookname).first
				if tb
					tb.destroy

					#increment number
					binfo.number = binfo.number + 1
					binfo.save
	
					#add to book
					Book.create(:username => current_user.username, :book_title => bookname)
	
					#add to owned
					Ownedbook.create(:username => current_user.username, :book_title => bookname)
				else
					return redirect_to(root_url)
				end
			end
		else
			flash[:editbookmessage] = bookname + " is back on sale"
			return redirect_to(root_url)
		end
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end

 def delete
	if params[:book]
		bookname = params[:book].strip

		#if book exist
		binfo = Bookinfo.where(:book_title => bookname).first
		if binfo
			#remove from traded
			tb = Tradedbook.where(:username => current_user.username, :book_title => bookname).first
			if tb
				tb.destroy
			else
				return redirect_to(root_url)
			end
		else
			return redirect_to(root_url)
		end
		flash[:editbookmessage] = bookname + " is deleted from the record"
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end
end
