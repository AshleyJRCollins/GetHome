class AddCompletedToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :completed, :boolean, default: false
  end
end
