class UserController < ApplicationController 

	get "/account" do
		# binding.pry
		@user = User.find(Helpers.current_user(session))
		erb :"users/index"
	end

	# change name, password, delete account.
end