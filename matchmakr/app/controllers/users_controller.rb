class UsersController < ApplicationController
	def index
		@users = User.all
		render 'index'
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		#, user_id: current_user.id)
		puts "New @user object is #{@user}"
		if @user.save
			puts "New user saved successfully."
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
	    @user = User.find(params[:id])
	end

	def show
	    @user = User.find(params[:id])
	end

	def delete
		@user = User.find(params[:id])
	  	@user.destroy
	  	redirect_to users_path
	end

private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :age, :gender, :interests)
	end	

end
