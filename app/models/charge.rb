class Charge < ActiveRecord::Base
	belongs_to :complaint
	belongs_to :user
end