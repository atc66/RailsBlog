class SessionsController < ApplicationController

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:message] = "you Logged in"
			redirect_to '/'
		else
			flash[:message] = "Try Again"
			redirect_to '/login'
		end
	end

end
