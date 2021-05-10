class FeedController < ApplicationController
    def index

        if current_user
            # session.delete(:rooms)
            # @welcome_posts = Post.all
            @users = User.all
            @posts = Post.followed_user(current_user).order('posts.created_at DESC')
            # @posts = Post.all.reverse
            follower_ids = current_user.followers.map(&:follower_id)

            @welcome_users = User.all.where.not(id: current_user)

            @welcome_posts = Post.all.where.not(user_id: current_user.id).order('posts.created_at DESC')

            

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

        else 
            redirect_to explorer_index_path            
        end
    end
end