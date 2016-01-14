class User < ActiveRecord::Base
	has_one :driver
	has_one :passenger
end
