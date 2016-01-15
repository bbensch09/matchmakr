class PassengersController < ApplicationController

	def index
		@passengers = Passenger.all
		render 'index'
	end

	def new
		@passenger = Passenger.new
	end

	def create
		@passenger = Passenger.new(params, user_id: current_user.id)
		puts "New @passenger object is #{@passenger}"
		if @passenger.save
			redirect_to @passenger
			puts "New passenger saved successfully."
		else
			render 'new'
		end
	end

	def edit
	end

	def show
	end

	def show
	end

	def delete
	end

	private

	def params
		params.require(:passenger).permit(:first_name, :last_name, :age, :gender, :interests)
	end

end
