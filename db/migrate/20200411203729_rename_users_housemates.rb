class RenameUsersHousemates < ActiveRecord::Migration
  def change
  	rename_table :users_housemates, :user_housemates
  end
end
