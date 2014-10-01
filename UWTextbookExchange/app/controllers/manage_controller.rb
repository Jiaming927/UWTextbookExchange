class ManageController < ApplicationController
 require 'mail'
 layout false 
 before_filter :authenticate_user!

 # admin dashboard
 def manage
	if !current_user.admin
		return redirect_to(root_url)
	end
 end

 def overview
	if !current_user.admin
		return redirect_to(root_url)
	end
	@msgcs = Msgcount.where("last_update >= ?", 2.minutes.ago)
	@users_today = User.where("current_sign_in_at >= ?", 1.day.ago)
	@users_thisweek = User.where("current_sign_in_at >= ?", 1.week.ago)
	@msg_today = Message.where("created_at >= ?", 1.day.ago)
	@msg_thisweek = Message.where("created_at >= ?", 1.week.ago)
 end

 # manage all users
 def usermanage
	if !current_user.admin
		return redirect_to(root_url)
	end
	if params["page"].present? && params["page"].numeric?
		@page = params["page"].to_i
		if @page > 1 && (@page  - 1) * 50 > User.count
			@users = User.last(50)
			@page = User.count/50+(User.count%50==0 ? 0 : 1)
		else
			@users = User.limit(50).offset((@page-1)*50)
		end
	else
		@users = User.limit(50)
		@page = 1
	end
 end

 def userdetails
	if !current_user.admin
		return redirect_to(root_url)
	end

	if params["id"].present? && params["id"].numeric?
		@user = User.find(params["id"].to_i)
		if !@user
			flash[:notice] = "The user does not exist"
			return redirect_to('/usermanage')
		end
	elsif params["username"].present?
		@user = User.where(:username => params["username"].strip).first
		if !@user
			flash[:notice] = "The user does not exist"
			return redirect_to('/usermanage')
		end
	else
		flash[:notice] = "The user does not exist"
		return redirect_to('/usermanage')
	end
 end

 def bookmanage
	if !current_user.admin
		return redirect_to(root_url)
	end
	if params["page"].present? && params["page"].numeric?
		@page = params["page"].to_i
		if @page > 1 && (@page  - 1) * 50 > Bookinfo.count
			@binfos = Bookinfo.last(50)
			@page = Bookinfo.count/50+(Bookinfo.count%50==0 ? 0 : 1)
		else
			@binfos = Bookinfo.limit(50).offset((@page-1)*50)
		end
	elsif params["course"].present? && !params["course"].blank?
		@binfos = Bookinfo.where("course_name LIKE ?", "%" + params["course"].strip.upcase + "%")
		if !(@binfos && @binfos.count > 0)
			flash[:notice] = "The course does not exist"
			return redirect_to('/bookmanage')
		end
	else
		@binfos = Bookinfo.limit(50)
		@page = 1
	end
 end

 def bookedit
	if !current_user.admin
		return redirect_to(root_url)
	end

	if params["id"].present? && params["id"].numeric?
		@binfo = Bookinfo.find(params["id"].to_i)
		if !@binfo
			flash[:notice] = "The book does not exist"
			return redirect_to('/bookmanage')
		end
	else
		flash[:notice] = "Missing parameters"
		redirect_to('/bookmanage')
	end
 end

 def bookchangesave
	if !current_user.admin
		return redirect_to(root_url)
	end

	if params[:binfo].present? && params[:binfo]["id"].present? && !params[:binfo]["id"].blank? && params[:binfo]["id"].numeric? && params[:binfo]["book_title"].present? && !params[:binfo]["book_title"].blank? && params[:binfo]["course_name"].present? && !params[:binfo]["course_name"].blank?
		if params[:binfo]["price"].present? && !params[:binfo]["price"].blank?
			if !params[:binfo]["price"].numeric?
				flash[:notice] = "The price must be a number."
				return redirect_to('/bookedit?id=' + params[:binfo]["id"].strip)
			end
		end
		binfo = Bookinfo.find(params[:binfo]["id"].to_i)
		if binfo
			binfo.book_title = params[:binfo]["book_title"].strip.upcase
			binfo.author = params[:binfo]["author"].strip.upcase
			binfo.price = params[:binfo]["price"].strip
			binfo.course_name = params[:binfo]["course_name"].upcase.split(',').sort.join(',')
			if binfo.save
				flash[:notice] = "Book information updates successfully"
				return redirect_to('/bookmanage')
			else
				flash[:notice] = "Book information updates failed. Database error."
				return redirect_to('/bookmanage')
			end
		end
	else
		flash[:notice] = "Missing parameters"
		return redirect_to('/bookmanage')
	end

 end

 # manage new book request
 def reviewnew
	if !current_user.admin
		return redirect_to(root_url)
	end
	@allrequest = Newbook.all.order('created_at DESC')
 end

 def newdetails
	if !current_user.admin
		return redirect_to(root_url)
	end

	if params["book_title"].present? && !params["book_title"].blank?
		@request = Newbook.where(:book_title => params["book_title"].strip).first
		if !@request
			return redirect_to('/reviewnew')
		end
		@request.reviewed = true
		@request.save
	else
		redirect_to('/reviewnew')
	end
 end

 def passnew
	if !current_user.admin
		return redirect_to(root_url)
	end

	if params[:request].present? && params[:request]["id"].present? && !params[:request]["id"].blank? && params[:request]["id"].numeric? && params[:request]["book_title"].present? && !params[:request]["book_title"].blank? && params[:request]["course_name"].present? && !params[:request]["course_name"].blank?
		if params[:request]["price"].present? && !params[:request]["price"].blank?
			if !params[:request]["price"].numeric?
				flash[:notice] = "The price must be a number."
				return redirect_to('/newdetails?book_title=' + params[:request]["book_title"].strip)
			end
		end
		newbook = Newbook.find(params[:request]["id"].strip)
		if newbook
			newbook.book_title = params[:request]["book_title"].strip.upcase
			newbook.author = params[:request]["author"].strip.upcase
			newbook.price = params[:request]["price"].strip
			newbook.course_name = params[:request]["course_name"].strip.upcase
			newbook.passed = params[:request]["passed"].strip
			if newbook.save
				if newbook.passed
					# add to bookinfo
					binfo = Bookinfo.where(:book_title => newbook.book_title).first
					if !binfo
						Bookinfo.create(:book_title => newbook.book_title, :author => newbook.author, :price => newbook.price, :course_name => newbook.course_name)
						# add to course 
						course = Course.where(:course_name => newbook.course_name).first
						if course
							if course.number >= 15
								# retrieve database
								Bookinfo.where(:book_title => newbook.book_title).first.destroy
								newbook.passed = nil
								newbook.save
								flash[:notice] = "More than 15 books for one course."
								return redirect_to('/reviewnew')
							end
							nextbook = 'book' + (course.number+1).to_s
								course.number = course.number + 1
							course.assign_attributes({nextbook.to_sym => newbook.book_title})
							course.save
						else
							Course.create(:course_name => newbook.course_name, :number => 1, :book1 => newbook.book_title)
						end
					end
					newbookpass(newbook)
					flash[:notice] = newbook.book_title + " is added."
				end
			end
			redirect_to('/reviewnew')
		else
			flash[:notice] = "Someone has already submitted a request for this book"
			redirect_to('/reviewnew')
		end
	else
		flash[:notice] = "Missing required fields."
		redirect_to('/reviewnew')
	end
 end

 private

 def newbookpass(newbook)
	content = <<MESSAGE_END
<div style = "bgcolor=#FFFFFF;font-family:Helvetica-Neue, Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;width:50%;
			height:100%;margin-left:auto;
			margin-right:auto;">
				
	<div class="content">
		<p id="head" style = "color: orange; font-size: 17px;" style="margin-bottom: 10px; font-weight: normal; font-size:14px; line-height:1.6;color:grey;">
			Hustees
		</p>
	</div>

	<div>
			<h3 style="font-weight:800; font-size: 27px;color:grey; margin-bottom:15px;line-height: 1.1;font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;">
				Congratulations!
			</h3>

			<p style="margin-bottom: 10px; font-weight: normal; font-size:14px; line-height:1.6;color:grey;">Hello #{newbook.email}!</p>

			<p style="margin-bottom: 10px; font-weight: normal; font-size:14px; line-height:1.6;color:grey;">We've carefully reviewed your request for the book "#{newbook.book_title}"</p>

			<p style="margin-bottom: 10px; font-weight: normal; font-size:14px; line-height:1.6;color:grey;">Now it is on our list.</p>

			<p class="callout" style="font-weight: normal; font-size:14px; line-height:1.6;padding:15px; background-color:#ECF8FF; margin-bottom: 15px;">
				<a href="#{root_url}" style="color: #2BA6CB;font-weight:bold;">Go and post it</a>!

			</p>
			
	</div>

	<div class="social" style="width: 100%;float:center;background-color:rgb(255,241,193);text-align:center;font-weight:bold;">
		<h5 style="font-weight:500; font-size: 14px;color:grey;text-align:middle;padding-bottom:15px;padding-top:15px;margin-bottom:15px;line-height: 1.1;font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;">
			Thank your for supporting us!
		</h5>
	</div>

	<div id="footer" style="text-align: center;">
			<p style="margin-bottom: 10px; font-weight: normal; font-size:14px; line-height:1.6;color:grey;">
				<a href="#" style="color: #2BA6CB;">Terms</a>
				<p style="margin-bottom: 10px; font-weight: normal; font-size:14px; line-height:1.6;color:grey;"> &copy; Copy right 2014 Hustees</p>
			</p>
	</div>
					
</div>
MESSAGE_END

	sendout(newbook.email, 'tebookglobal@gmail.com', 'Your requested book is on now!', content.html_safe)
 end
end
