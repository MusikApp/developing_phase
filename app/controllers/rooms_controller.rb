class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /rooms or /rooms.json
  def index
    session[:rooms] ||= []
    @users = User.followed_user(current_user)
    @rooms = Room.includes(:recipient, :messages).find(session[:rooms])
    # @suggestions = User.all.where()
    # @rooms = Room.my_rooms(current_user)
    
    #search users
    @q = params[:query]
      
    if @q
        if User.where("name ~* ?", @q).count > 0
            @users = User.where("name ~* ?", @q).page(params[:page])
        elsif User.where("username ~* ?", @q).count > 0
          @users = User.where("username ~* ?", @q).page(params[:page])
        else
            @users = User.all
        end
    end 

  end

  # GET /rooms/1 or /rooms/1.json
  def show
    session[:rooms] ||= []
    @users = User.followed_user(current_user)
    @rooms = Room.includes(:recipient, :messages).find(session[:rooms])

    #search users
    @q = params[:query]

    render 'index'
  end


  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.get(current_user.id, params[:user_id])

    add_to_rooms unless conversated?

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    # @room.destroy
    session[:rooms].delete(@room.id)
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def add_to_rooms
      session[:rooms] ||= []
      session[:rooms] << @room.id
    end

    def conversated?
      session[:rooms].include?(@room.id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :user_id)
    end
end
