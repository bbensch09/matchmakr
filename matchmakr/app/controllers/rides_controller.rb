class RidesController < ApplicationController	
	def index
		@rides = Ride.all
		render 'index'
	end

	def new
		@ride = Ride.new
	end

	def create
		@ride = Ride.new(ride_params)
		#, user_id: current_user.id)
		puts "New @ride object is #{@ride}"
		if @ride.save
			puts "New rides saved successfully."
			redirect_to @ride
		else
			render 'new'
		end
	end

	def edit
	    @ride = Ride.find(params[:id])
	end

	def show
	    @ride = Ride.find(params[:id])
	end

	def delete
		@ride = Ride.find(params[:id])
	  	@ride.destroy
	  	redirect_to rides_path
	end

private

	def ride_params
		#NOTE -- must pass through user_id once session authentication is in place
		params.require(:ride).permit(:passenger_id, :driver_id, :date, :ride_start_time, :ride_end_time, :pickup_location, :dropoff_location)
	end	


end
