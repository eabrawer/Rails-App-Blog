class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params.require(:post).permit(:title, :content))
		if @post.save
			redirect_to posts_url
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @picture.update_attribues(params.require(:post).permit(:title, :content))
			redirect_to posts_url
		else
			render :edit
		end 

	end 

	def delete
		@post = Post.find(params[:id])
    	@post.destroy
    	redirect_to posts_url
	end 
end
