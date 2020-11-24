class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :status
      t.string :starting_location
      t.string :ending_location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
