class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_post
  before_action :authenticate_user!
  
  # GET /comments or /comments.json
  def index
    # @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def reply
    @reply = Comment.new
    @reply.content = params[:content]
    @reply.post_id = params[:post_id]
    @reply.user_id = current_user.id
    @reply.reply_id = params[:id]

    respond_to do |format|
      if @reply.save
        format.html { redirect_to root_path, notice: "Reply was successfully created." }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path(@post, @comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id, :reply_id)
    end
end


