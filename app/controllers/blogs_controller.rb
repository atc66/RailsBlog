class BlogsController < ApplicationController

	def index 
		@blogs = Blog.all
	end

	def new
		@user = User.find(current_user.id)
		@blog = Blog.new
	end

	def create
		@user = User.find(current_user.id)
		@blog = Blog.new(blog_params)
		if @blog.save
			flash[:message] = 'Your blog was created successfully'
			redirect_to '/blogs'
		else
			flash[:message] = 'try again'
			render '/blogs/new'
		end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		if blog.update(blog_params)
			flash[:message] = 'Your blog was edited successfully'
			redirect_to "/blogs/#{blog.id}"
		else
			flash[:message] = 'Try again'
			render "/blogs/#{blog.id}/edit"
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
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
		params.require(:user).permit(:id)
	end

end
