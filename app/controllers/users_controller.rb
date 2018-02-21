class UsersController < ApplicationController

	def index 
		@users = User.all
	end

	def new
		
	end

	def create
		
		if 
		else
			
		end
	end

	def show
	
	end

	def edit
		
	end

	def update
		
		if 
		else
	
		end
	end

	def destroy
		
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end
