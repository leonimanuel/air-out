class CreateUsersHousemates < ActiveRecord::Migration
  def change
  	create_table :users_housemates do |t|
  		t.integer :user_id
  		t.integer :housemate_id
  	end
  end
end
