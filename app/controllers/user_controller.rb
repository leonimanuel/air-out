class UserController < ApplicationController 

	get "/account" do
  	redirect "/login" if !Helpers.is_logged_in?(session)

		@user = User.find(Helpers.current_user(session))
		erb :"users/index"
	end

	get "/account/housemates" do
  	redirect "/login" if !Helpers.is_logged_in?(session)

		@user = User.find(Helpers.current_user(session))
		erb :"users/housemates"
	end
	# change name, password, delete account.
	# get "account/complaints" do
end