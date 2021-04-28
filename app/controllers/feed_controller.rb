class FeedController < ApplicationController
    def index
        @users = User.all
        @posts = Post.all
        @post = Post
        follower_ids = current_user.followers.map(&:follower_id)

        @q = params[:query]
    
        if @q
            if Post.where("content ~* ?", @q).count > 0
                @posts = Post.where("content ~* ?", @q).page(params[:page])
            elsif Post.where("user.username ~* ?", @q)
                @posts = Post.all.joins(:user).where("username ~* ?", @q).page(params[:page])
            else
                @posts = Post.all
            end
        end

    end
end