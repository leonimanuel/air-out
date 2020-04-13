class House < ActiveRecord::Base
	has_many :occupants, class_name: "User", foreign_key: "house_id"
end