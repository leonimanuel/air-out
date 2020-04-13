class Complaint < ActiveRecord::Base
	has_one :charge
	belongs_to :user
	belongs_to :housemate, class_name: "User"
end