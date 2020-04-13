class CreateComplaints < ActiveRecord::Migration
  def change
  	create_table :complaints do |t|
  		t.string :name
  		t.integer :user_id
  		t.integer :housemate_id
  	end
  end
end
