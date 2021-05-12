class RelationshipsController < ApplicationController
    before_action :authenticate_user!

    def create
        respond_to do |format|
            other_user = User.find(params[:id])
            @rel = Relationship.new(follower_id: current_user.id,
                                     followed_id: other_user.id)
            @rel.save

            format.html{ redirect_back fallback_location: @rel}
            format.js{}
        end
    end
    
    def destroy
        respond_to do |format|
            other_user = User.find(params[:id])
            @rel = Relationship.find(current_user.following.where(followed_id: other_user.id).ids.first)
            @rel.destroy

            format.html{ redirect_back fallback_location: @rel }
            format.js{}
        end
    end
end