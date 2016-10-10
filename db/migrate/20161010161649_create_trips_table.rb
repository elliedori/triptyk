class CreateTripsTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :destination_id
    end
  end
end
