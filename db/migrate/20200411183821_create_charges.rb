class CreateCharges < ActiveRecord::Migration
  def change
  	create_table :charges do |t|
  		t.integer :complaint_id
  		t.integer :user_id
  	end
  end
end
