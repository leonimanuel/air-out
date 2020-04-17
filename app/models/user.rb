class User < ActiveRecord::Base
	has_secure_password

	has_many :complaints
	has_many :charges, class_name: "Complaint", foreign_key: "housemate_id"
	has_many :user_housemates
	has_many :housemates, :through => :user_housemates
	belongs_to :house

	after_create :buddy_up

	def buddy_up
  	User.all.each do |user|
			if user.id != self.id
	  		UserHousemate.create(user: self, housemate: user) 
	  		user.housemates << self
			end
  	end
	end
end