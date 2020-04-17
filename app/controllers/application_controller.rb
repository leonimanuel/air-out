require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "future_lesson"
  end

  get "/" do

    erb :index
  end

  get "/signup" do
   	redirect "/account" if Helpers.is_logged_in?(session)

  	@houses = House.all
  	erb :signup
  end

  post "/signup" do
  	# binding.pry
    if  params[:house_name].empty? || 
  			(params[:user_name].empty? || params[:user_email].empty? || params[:user_password].empty?)
   		redirect "/signup"
  	end

  	if User.all.any? {|user| user.email == params[:user_email]}
  		redirect "/signup"
  		# NOTIFY
  	end

  	if !params[:house_name].empty?
  		house = House.find_or_create_by(name: params[:house_name])
  	end
  	# binding.pry
  	# current_occupants = house.occupants
  	# user = User.create(name: params[:user_name], email: params[:user_email], password: params[:user_password], house: house)
 		new_user = User.create(name: params[:user_name], email: params[:user_email], password: params[:user_password], house: house)

  	User.all.each do |user|
			if user.id != new_user.id
	  		UserHousemate.create(user: new_user, housemate: user) 
	  		UserHousemate.create(user: user, housemate: new_user)
			end
  	end
 		# user.housemates << current_occupants
 		# user.housemates.each { |housemate| housemate.housemates << user}
  	
  	session[:user_id] = new_user.id
  	redirect "/account"
  end

  get "/login" do
  	redirect "/account" if Helpers.is_logged_in?(session)

  	erb :login
  end

  post "/login" do
	  user = User.find_by(:email => params[:user_email])
	 
	  if user && user.authenticate(params[:user_password])
	    session[:user_id] = user.id
	    redirect "/account"
	  else
	    redirect "/login"
	  end  	
  end


  get "/logout" do
  	if !Helpers.is_logged_in?(session)
  		# RACK FLASH
  	end
  	
  	session.clear
  	redirect "/"
  end
end










