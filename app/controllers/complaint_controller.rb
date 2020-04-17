class ComplaintController < ApplicationController 
  before do
    redirect '/' unless Helpers.is_logged_in?(session)
  end

	get "/account/complaints" do
  	# redirect "/login" if !Helpers.is_logged_in?(session)

  	@user = Helpers.current_user(session)
		erb :"complaints/index"
		# binding.pry

	end	

	get "/account/complaints/new" do
  	# redirect "/login" if !Helpers.is_logged_in?(session)
  	@user = Helpers.current_user(session)
		erb :"complaints/new"
	end

	post "/account/complaints" do
		content = params[:complaint][:content]
		housemate = User.find(params[:complaint][:housemate])
		user = Helpers.current_user(session)
		complaint = Complaint.create(content: content, user: user, housemate: housemate)

		redirect "/account/complaints"
	end

	get "/account/charges" do
  	# redirect "/login" if !Helpers.is_logged_in?(session)
  	@user = Helpers.current_user(session)

		erb :"complaints/charges"
	end

	get "/account/complaints/:id" do
		@complaint = Complaint.find(params[:id])
		if @complaint.user != Helpers.current_user(session)
			flash[:notice] = "Can't access that complaint."
			redirect "account/complaints"
		end
		erb :"complaints/show"
	end

	get "/account/complaints/:id/edit" do
  	@complaint = Complaint.find(params[:id])
  	redirect "/login" if !Helpers.is_logged_in?(session) ||
  		@complaint.user != Helpers.current_user(session)
  	# @user = Helpers.current_user(session)
  	erb :"complaints/edit"
	end

  patch "/account/complaints/:id" do
		complaint = Complaint.find(params[:id])
		complaint.update(content: params[:content])
		complaint.save    

    redirect "/account/complaints"
  end

	delete "/account/complaints/:id/delete" do
  	# binding.pry
  	complaint = Complaint.find(params[:id])
  	complaint.destroy

  	redirect "/account/complaints"
	end
end