class BlogsController < ApplicationController

	def index 
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def create
		blog = Blog.new(blog_params)
		if blog.save
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

	private
		def blog_params
		params.require(:blog).permit(:title, :category, :content)
	end

end
