# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.delete_all
Driver.delete_all
Passenger.delete_all
Ride.delete_all


def unique_user
	{
	  password_hash: "password",	  
	  email: Faker::Internet.email
	}
end

5.times do
	User.create!(unique_user)
end

def unique_driver
	{
	user_id: (rand(4) + 1),
	vehicle_id: (rand(4) + 1),
    name: Faker::Hipster.sentence(4)
    }
end

def create_driver
	Driver.create!(unique_driver)
end

def unique_passenger
	{
	user_id: (rand(4) + 1),
    name: Faker::Hipster.sentence(4),
    age: (rand(20)+18),
    gender: rand(2) == 1 ? "Male" : "Female",
    interests: Faker::Commerce.department

    }
end

def unique_ride
	{
		driver_id: (rand(4) + 1),
		passenger_id: (rand(4) + 1),
		date: Faker::Date.between(30.days.ago,Date.today),
		ride_start_time: Faker::Time.between(DateTime.now - 1, DateTime.now),
		ride_end_time: Faker::Time.between(DateTime.now + 1, DateTime.now),
	    pickup_location: "user's home",
    	dropoff_location: "SFO Airport"

	}
end	

def create_driver
	Passenger.create!(unique_passenger)
end

5.times do
	Ride.create!(unique_ride)
end

User.create!(email: "test@test.com", password_hash: "test")

