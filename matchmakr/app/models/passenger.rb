class Passenger < ActiveRecord::Base
	serialize :interests
	has_many :rides
	has_many :driven_by, through: :rides, source: :driver
end
