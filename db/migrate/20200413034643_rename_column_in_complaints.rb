class RenameColumnInComplaints < ActiveRecord::Migration
  def change
  	rename_column :complaints, :name, :content
  end
end
