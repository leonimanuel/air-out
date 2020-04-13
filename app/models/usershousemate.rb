class UserHousemate < ActiveRecord::Base
	belongs_to :user
	belongs_to :housemate, class_name: "User"
end