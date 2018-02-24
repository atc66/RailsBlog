class CommentsController < ApplicationController

	def index
		
	end

	def new
		@blog = Blog.find(params[:blog_id])
		@comment = Comment.new
	end


	def create
		@user = User.find(current_user.id)
		@blog = Blog.find(params[:id])
		comment = Comment.new(comment_params)
		if @comment.save
			flash[:message] = 'Your comment was posted'
			redirect_to "/blogs/#{@blog.id}/comments/"
		else
			flash[:message] = 'try again'
			render '/blogs/#{@blog.id}/comments/new'
		end
	end

	def show
		@comment = Comment.find(params[:id])
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
