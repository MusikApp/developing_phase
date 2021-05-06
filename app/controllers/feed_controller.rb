class FeedController < ApplicationController
    def index
        # session.delete(:rooms)
        @users = User.all
        @posts = Post.followed_user(current_user).order('posts.created_at DESC')
        follower_ids = current_user.followers.map(&:follower_id)


        @comments = Comment.all
        @comment = Comment.new

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