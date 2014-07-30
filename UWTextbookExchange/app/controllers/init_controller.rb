class InitController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:index, :terms]

 def index
	if user_signed_in?
		@msgc = Msgcount.where(:username => current_user.username).first
		if !@msgc
			Msgcount.create(:username => current_user.username)
		else
			@msgc.last_update = Time.now
			@msgc.save
		end
	end
 end

 def chat
	if params[:receiver] && !params[:receiver].blank?
		@receiver = params[:receiver].strip
	end
	@msgc = Msgcount.where(:username => current_user.username).first
	if @msgc
		@msgc.last_update = Time.now
		@msgc.save
	end
 end


 def chatlist
	@msgc = Msgcount.where(:username => current_user.username).first
	if @msgc
		@msgc.last_update = Time.now
		@msgc.save
	end
	@chnls = Channel.where("channel_name LIKE ? OR channel_name LIKE ?", current_user.username + "%", "%" + current_user.username).order("updated_at DESC")

 end

 def showcount
	msgc = Msgcount.where(:username => current_user.username).first
	if msgc
		msgc.last_update = Time.now
		msgc.save
		if params[:receiver] && !params[:receiver].strip.blank?
			msgc_receiver = Msgcount.where(:username => params[:receiver].strip).first
			if msgc_receiver
				if msgc_receiver.last_update > 2.minutes.ago
					render :json => { :count => msgc.unread, :online => 1}
				else
					render :json => { :count => msgc.unread, :online => 0}
				end
			else
				render :json => { :count => msgc.unread}
			end

		else
			render :json => { :count => msgc.unread}
		end
	else
		render :json => { :count => 0}
	end
 end

 def personal
	@msgc = Msgcount.where(:username => current_user.username).first
	if @msgc
		@msgc.last_update = Time.now
		@msgc.save
	end
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
		flash[:notice] = bookname + " is unlisted"
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
		flash[:notice] = bookname + " is successfully traded"
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
				flash[:notice] = "You have already posted the book"
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
			return redirect_to(root_url)
		end
		flash[:notice] = bookname + " is back on sale"
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
		flash[:notice] = bookname + " is deleted from the record"
		return redirect_to('/personal')
	else
		return redirect_to(root_url)
	end
 end
end
