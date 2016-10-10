class CreateTripsTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :user_id
      t.string :destination_id
  end
end
