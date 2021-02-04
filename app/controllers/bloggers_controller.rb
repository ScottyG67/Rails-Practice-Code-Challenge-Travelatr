class BloggersController < ApplicationController

    def show
        #byebug
        @blogger = Blogger.find_by(id: params[:id])
        @number_of_likes = @blogger.posts.sum{|post| post.likes}
        @featured_post = @blogger.posts.max_by {|post| post.likes}
    end

    def index
        @bloggers = Blogger.all
    end



end