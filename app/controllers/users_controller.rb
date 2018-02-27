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
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		if current_user.id == @user.id

		else
			# change where it redirects to
			redirect_to user_path
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:message] = 'Your user information was edited successfully'
			redirect_to "/users/#{@user.id}"
		else
			flash[:message] = 'Try again'
			render "/users/#{@user.id}/edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	private
	def comment_params
		params.require(:comment).permit(:message, :user_id, :blog_id)
	end
	
	def blog_params
		params.require(:blog).permit(:title, :category, :content, :user_id)
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :user_id)
	end

end
