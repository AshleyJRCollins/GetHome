class AddStatusToRequest < ActiveRecord::Migration[6.0]
  def change  
  	remove_column :requests, :status, :string
    add_column :requests, :status, :integer
  end
end
