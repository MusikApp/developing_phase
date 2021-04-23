class RelationshipsController < ApplicationController
    before_action :authenticate_user!


    def create
        other_user = User.find(params[:user_id])
        @rel = Relationship.new(follower_id: current_user.id,
                                 followed_id: other_user.id)
        @rel.save
        # redirect_to user_path(other_user)
        redirect_to root_path

  
    end
    
    def destroy
        @rel = Relationship.find(params[:id])
        @rel.destroy
        # redirect_to user_path(@rel.followed_id)
        redirect_to root_path

    end
end