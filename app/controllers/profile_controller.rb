class ProfileController < ApplicationController

    def index
        @my_posts = Post.where(user_id: current_user.id).reverse
    end

    def show
        @user = User.find(params[:id])
        @user_posts = Post.where(user_id: @user.id)
    end
end