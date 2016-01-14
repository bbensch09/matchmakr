class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
    	t.string :pickup_location
    	t.string :dropoff_location
    	t.datetime :ride_start_time
    	t.datetime :ride_end_time
    	t.date :date
    	t.integer :passenger_id
    	t.interger :driver_id
      t.timestamps null: false
    end
  end
end
