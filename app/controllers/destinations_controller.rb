class DestinationsController < ApplicationController

    def index
        @destinations= Destination.all
    end

    def show
        @destination = Destination.find_by(id: params[:id])
        @average_age = average_age
        @featured_post = @destination.posts.max_by {|post| post.likes}
        @recent_posts = recent_posts
    end

    private

    def average_age
        @destination.bloggers.sum{|blogger|blogger.age}/@destination.bloggers.length
    end
    def recent_posts
        @destination.posts.order(:created_at).last(5)
    end






end