class FeedController < ApplicationController
    def index
        @users = User.all
        @posts = Post.all
        follower_ids = current_user.followers.map(&:follower_id)
    
        # @post = Post.find(params[:post_id])
        # @comment = @post.comments.new 
    end
end