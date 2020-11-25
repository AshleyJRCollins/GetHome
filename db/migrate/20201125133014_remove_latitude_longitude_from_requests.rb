class RemoveLatitudeLongitudeFromRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :latitude, :string
    remove_column :requests, :longitude, :string
  end
end
