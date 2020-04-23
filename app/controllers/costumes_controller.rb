class CostumesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_costume, only: [:show, :edit, :update, :destroy, :add_more_images, :update_costume_images]
  load_and_authorize_resource

  # GET /costumes
  # GET /costumes.json
  def index
    @costumes = Costume.where(:user_id => current_user.id)
  end

  # GET /costumes/1
  # GET /costumes/1.json
  def show
  end

  # GET /costumes/new
  def new
    @costume = Costume.new
  end

  # GET /costumes/1/edit
  def edit
  end

  # POST /costumes
  # POST /costumes.json
  def create
    @costume = Costume.new(costume_params)

    respond_to do |format|
      if @costume.save!
        format.html { redirect_to @costume, notice: 'Cosplay was successfully created.' }
        format.json { render :show, status: :created, location: @costume }
      else
        format.html { render :new }
        format.json { render json: @costume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costumes/1
  # PATCH/PUT /costumes/1.json
  def update
    respond_to do |format|
      if @costume.update!(costume_params)
        format.html { redirect_to @costume, notice: 'Cosplay was successfully updated.' }
        format.json { render :show, status: :ok, location: @costume }
      else
        format.html { render :edit }
        format.json { render json: @costume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costumes/1
  # DELETE /costumes/1.json
  def destroy
    @costume.destroy
    respond_to do |format|
      format.html { redirect_to costumes_url, notice: 'Cosplay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Custom actions

  # GET /add_images/:id
  # GET modal form to add more images to an existing costume
  def add_more_images
    respond_to do |f|
      f.html {}
      f.js {}
    end
  end

  # PATCH /update_costume_images
  # It updates and add more images to costume object
  def update_costume_images
    @costume.update(costume_params)
    redirect_to(@costume, :notice => 'Image(s) added successfully.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costume
      @costume = Costume.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costume_params
      params.require(:costume).permit(:name, :desc, :user_id, images: [])
    end
end
