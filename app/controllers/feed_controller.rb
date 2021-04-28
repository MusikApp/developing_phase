class FeedController < ApplicationController
    def index
        @users = User.all
        @posts = Post.all
        follower_ids = current_user.followers.map(&:follower_id)
    
        # @post = Post.find(params[:post_id])
        # @comment = @post.comments.new 

        @q = params[:query]
    
        if @q
            if Post.where("content ~* ?", @q)
                @posts = Post.where("content ~* ?", @q).page(params[:page])
            elsif Post.where("user.username ~* ?", @q)
                @posts = Post.where("user.username ~* ?", @q).page(params[:page])
            else
                @posts = Post.all
                #@posts = Post.page(params[:page])
            end
        end

    end
end