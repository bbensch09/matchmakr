class PassengersController < ApplicationController

	def index
		@passengers = Passenger.all
		render 'index'
	end

	def new
		@passenger = Passenger.new
	end

	def create
		@passenger = Passenger.new(passenger_params)
		#, user_id: current_user.id)
		puts "New @passenger object is #{@passenger}"
		if @passenger.save
			puts "New passenger saved successfully."
			redirect_to @passenger
		else
			render 'new'
		end
	end

	def edit
	    @passenger = Passenger.find(params[:id])
	end

	def show
	    @passenger = Passenger.find(params[:id])
	end

	def delete
		@passenger = Passenger.find(params[:id])
	  	@apassenger.destroy
	  	redirect_to passengers_path
	end

private

	def passenger_params
		params.require(:passenger).permit(:first_name, :last_name, :age, :gender, :interests)
	end	

end
