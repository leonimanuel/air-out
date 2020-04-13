class UserController < ApplicationController 

	get "/accounts/complaints" do
  	redirect "/login" if !Helpers.is_logged_in?(session)

		erb :"complaints/index"
	end	

	get "/accounts/complaints/new" do
  	redirect "/login" if !Helpers.is_logged_in?(session)

		erb :"complaints/new"
	end

	post "/accounts/complaints" do
		complaint = Complaint.create(params[:complaint], user: Helpers.current_user(session))
		
		redirect "/accounts/complaints"
	end
end