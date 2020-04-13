class User < ActiveRecord::Base
	has_secure_password

	has_many :complaints
	has_many :charges, class_name: "Complaint", foreign_key: "housemate_id"

	has_many :user_housemates
	has_many :housemates, :through => :user_housemates

	belongs_to :house
end