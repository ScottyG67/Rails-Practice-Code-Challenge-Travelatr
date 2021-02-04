class PostsController < ApplicationController

    def show

        @post = Post.find_by(id: params[:id])
        @blogger = @post.blogger
        @destination = @post.destination
        
    end

    def index
        @posts = Post.all

    end

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def new
    end

    def destroy
        byebug
        @post.destroy
    end


    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params(:blogger_id, :destination_id, :title, :content))
            redirect_to post_path(@post), notice: "Post saved"
        else
            redirect_to post_path(@post), notice: "Post not saved" 
        end
    end

    def create
        @post = Post.new(post_params(:blogger_id, :destination_id, :title, :content))
        @post.likes = 0
        if @post.save
            redirect_to post_path(@post), notice: "Post saved"
        else
            #render :text => "nope"
            redirect_to posts_path, notice: "Post not saved" 
        end
    end

    def like
        @post = Post.find_by(id: params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post), notice: "You must really like gibberish"
    end

    private

	def post_params(*args)
		params.require(:post).permit(*args)
	end




end