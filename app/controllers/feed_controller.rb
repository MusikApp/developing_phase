class FeedController < ApplicationController
    def index
        @users = User.all
        @posts = Post.all.reverse
        follower_ids = current_user.followers.map(&:follower_id)

        @comments = Comment.all
        @comment = Comment.new

        @q = params[:query]
    
        if @q
            if Post.where("content ~* ?", @q).count > 0
                @posts = Post.where("content ~* ?", @q).page(params[:page]).reverse
            elsif User.where("username ~* ?", @q).count > 0
                @posts = User.where("username ~* ?", @q).map{|user| user.posts}.flatten
            elsif Comment.all.where("content ~* ?", @q).count > 0
                @posts = Comment.all.where("content ~* ?", @q).map{|comment| comment.post}
            else
                @posts = Post.all
            end

        end
    end
end