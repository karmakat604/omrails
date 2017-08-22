class PicturesController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  def show
    @picture = Picture.find(params[:id])
  end

  # GET /pictures/new
  def new
    @picture = current_user.pictures.new
  end

  # GET /pictures/1/edit
  def edit
    @picture = current_user.pictures.find(params[:id])
  end

  # POST /pictures
  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to @picture, notice: 'Picture was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /pictures/1
  def update
    @picture = current_user.pictures.find(params[:id])
    if @picture.update(picture_params)
      redirect_to @picture, notice: 'Picture was successfully updated.' 
      render :show, status: :ok, location: @picture
    else
      render :edit
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture = current_user.pictures.find(params[:id])
    @picture.destroy
    redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
    head :no_content
  end

  private
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :description, :picture)
    end
end
