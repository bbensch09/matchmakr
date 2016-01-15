class DriversController < ApplicationController
	def index
		@drivers = Driver.all
		render 'index'
	end

	def new
		@driver = Driver.new
	end

	def create
		@driver = Driver.new(driver_params)
		#, user_id: current_user.id)
		puts "New @driver object is #{@driver}"
		if @driver.save
			puts "New Driver saved successfully."
			redirect_to @driver
		else
			render 'new'
		end
	end

	def edit
	    @driver = Driver.find(params[:id])
	end

	def show
	    @driver = Driver.find(params[:id])
	end

	def delete
		@driver = Driver.find(params[:id])
	  	@driver.destroy
	  	redirect_to drivers_path
	end

private

	def driver_params
		#NOTE -- must pass through user_id once session authentication is in place
		params.require(:driver).permit(:first_name, :last_name, :vehicle_id)
	end	

end
