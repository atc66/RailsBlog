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
		@user = User.find(current_user.id)
		@blog = Blog.find(params[:id])
		@comments = @blog.comments.all
		# Added below
		@comment = Comment.new

	end

	def edit
		@blog = Blog.find(params[:id])
		if current_user.id == @blog.user_id

		else
			redirect_to blog_path
		end
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			flash[:message] = 'Your blog was edited successfully'
			redirect_to "/blogs/#{@blog.id}"
		else
			flash[:message] = 'Try again'
			render "/blogs/#{@blog.id}/edit"
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to "/blogs"
	end

	private
	def comment_params
		params.require(:comment).permit(:message, :user_id, :blog_id, :username)
	end
	
	def blog_params
		params.require(:blog).permit(:title, :category, :content, :user_id, :username)
	end

	def user_params
		params.require(:user).permit(:id)
	end

end
