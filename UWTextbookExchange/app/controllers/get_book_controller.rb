class GetBookController < ApplicationController
 layout false 
 before_filter :authenticate_user!, :except => [:find, :show]
  def find
	if params["coursename"].present? && !params["coursename"].blank?
		@course = Course.where(:course_name => params[:coursename].strip.upcase).first
		if !@course
		  flash[:notice] = "This course is not held in this quarter, or misspell anything?"
		  return redirect_to(root_url)
		end
	elsif params[:course].present? && !params[:course].blank?
		session[:last_dep] = params[:course]["department"].strip
		session[:last_class] = params[:course]["class"].strip
		courseName = params[:course]["department"].strip.upcase + params[:course]["class"].strip
		@course = Course.where(:course_name => courseName).first
		if !@course
			flash[:notice] = "This course is not held in this quarter. Misspell anything? Or you can <a href='/newbook'>submit a request</a> for this new book.".html_safe
			return redirect_to(root_url)
		end
	else
		redirect_to(root_url)
	end
  end

  def show
	if params[:book].present? && !params[:book].blank?
		@book = Book.where(:book_title => params[:book].strip).includes("msgcount").order("msgcounts.last_update DESC")
		@bookinfo = Bookinfo.where(:book_title => params[:book].strip).first
		if !@bookinfo
			flash[:notice] = "The book does not exist."
			return redirect_to(root_url)
		end
	else
		redirect_to(root_url)
	end
  end

  def postto
	if params[:book].present? && !params[:book].blank? && params[:from].present? && !params[:from].blank? && (params[:from].strip == 'find' || params[:from].strip == 'show')
		bookname = params[:book].strip
		#if book in bookinfo
		binfo = Bookinfo.where(:book_title => bookname).first
		if binfo
			bk = Book.where(:username => current_user.username, :book_title => bookname).first
			if bk
				flash[:notice] = "You have already posted the book"
				if params[:from].strip == 'find'
					return redirect_to('/find?coursename=' + binfo.course_name.split(',').first)
				else
					return redirect_to('/show?book=' + bookname)
				end
			else
				#increment bookinfo
				binfo.number = binfo.number + 1
				if binfo.save
					#if user have traded the book, resume
					tb = Tradedbook.where(:username => current_user.username, :book_title => bookname).first
					if tb
						tb.destroy
					end
					#add to book
					Book.create(:book_title => bookname, :username => current_user.username)

					#add to owned
					Ownedbook.create(:book_title => bookname, :username => current_user.username)
					flash[:notice] = bookname + " is posted successfully"
					if params[:from].strip == 'find'
						return redirect_to('/find?coursename=' + binfo.course_name.split(',').first)
					else
						return redirect_to('/show?book=' + bookname)
					end
				end
			end
		end
	end
	redirect_to(root_url)
  end
end