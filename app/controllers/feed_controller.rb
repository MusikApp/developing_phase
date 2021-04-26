class FeedController < ApplicationController
    def index
        @users = User.all
        @posts = Post.all
        @post = Post
        follower_ids = current_user.followers.map(&:follower_id)
    end
end