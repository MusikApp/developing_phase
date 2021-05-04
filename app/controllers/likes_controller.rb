class LikesController < ApplicationController
  before_action :set_like, only: %i[ destroy ]
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def index
  end

  def create
    respond_to do |format|
      if already_liked?
        flash[:notice] = "You can't like more than once"
      else
        @findpost.likes.create(user_id: current_user.id)
        format.js{}
      end
    end
  end

  def destroy
    respond_to do |format|
      if !(already_liked?)
        flash[:notice] = "Cannot unlike"
      else
        @findlike.destroy
        format.js{}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  def find_post
    @findpost = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_like
    @findlike = @findpost.likes.find(params[:id])
 end
  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:like).permit(:id, :user_id, :post_id)
  end
end
