class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]

  # GET /pics
  # GET /pics.json
  def index
    @pics = Pic.all
  end

  # GET /pics/1
  # GET /pics/1.json
  def show
  end

  # GET /pics/new
  def new
    @pic = Pic.new
  end

  # GET /pics/1/edit
  def edit
  end

  # POST /pics
  # POST /pics.json
  def create
    @pic = Pic.new(pic_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @pic.save
        format.html { redirect_to root_path, notice: 'Showcase was successfully created.' }
        format.json { render :show, status: :created, location: @pic }
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pics/1
  # PATCH/PUT /pics/1.json
  def update
    respond_to do |format|
      if @pic.update(pic_params)
        format.html { redirect_to @pic, notice: 'Showcase was successfully updated.' }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.json
  def destroy
    @pic.destroy
    respond_to do |format|
      format.html { redirect_to pics_url, notice: 'Showcase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @pic.upvote_by(current_user)
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @pic.downvote_by(current_user)
    redirect_back(fallback_location: root_path)
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:name, :description, :image)
    end
end
