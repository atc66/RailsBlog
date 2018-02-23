class UsersController < ApplicationController

	def index 
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			flash[:message]="User Created"
			redirect_to '/users'
		else
			redirect_to users_new_path
			flash[:message]="Try Again"
		end
	end

	def show
	
	end

	def edit
		
	end

	def update
	
	end

	def destroy
		
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end
