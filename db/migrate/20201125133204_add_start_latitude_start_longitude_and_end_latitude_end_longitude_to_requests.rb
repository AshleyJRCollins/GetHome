class AddStartLatitudeStartLongitudeAndEndLatitudeEndLongitudeToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :start_latitude, :float
    add_column :requests, :start_longitude, :float
    add_column :requests, :end_latitude, :float
    add_column :requests, :end_longitude, :float
  end
end
