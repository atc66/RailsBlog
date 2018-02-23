class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def new
		@user = User.find(current_user.id)
		@blog = Blog.find(current_blog.id)
		@comment = Comment.new
	end


	def create
		@user = User.find(current_user.id)
		@blog = Blog.find(current_blog.id)
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:message] = 'Your comment was posted'
			redirect_to "/blogs/#{@blog.id}/comments/#{@comment.id}"
		else
			flash[:message] = 'try again'
			render '/blogs/#{@blog.id}/comments/'
		end
	end

	def show
		@comment = Comment.find_by_id(params[:id])
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if comment.update(comment_params)
			flash[:message] = 'Your comment was edited successfully'
			redirect_to "/blogs/#{@blog.id}/comments/"
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
