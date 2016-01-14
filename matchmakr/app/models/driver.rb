class Driver < ActiveRecord::Base
	has_many :rides
	has_many :passengers_driven, through: :rides, source: :passenger
end
