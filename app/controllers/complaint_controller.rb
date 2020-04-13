class ComplaintController < ApplicationController 

	get "/account/complaints" do
  	redirect "/login" if !Helpers.is_logged_in?(session)

  	@user = User.find(Helpers.current_user(session))
		erb :"complaints/index"
	end	

	get "/account/complaints/new" do
  	redirect "/login" if !Helpers.is_logged_in?(session)

  	@user = Helpers.current_user(session)
		erb :"complaints/new"
	end

	post "/account/complaints" do
		content = params[:complaint][:content]
		housemate = User.find(params[:complaint][:housemate])
		user = User.find(Helpers.current_user(session))

		complaint = Complaint.create(content: content, user: user, housemate: housemate)
		# binding.pry
		redirect "/account/complaints"
	end
end