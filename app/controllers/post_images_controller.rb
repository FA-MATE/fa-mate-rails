class PostImagesController < ApplicationController
  before_action :set_post_image, only: %i[ show update destroy ]

  # GET /post_images
  def index
    @post_images = PostImage.all
  end

  # GET /post_images/1
  def show
    render json: @post_image
  end

  # POST /post_images
  def create
    @post_image = PostImage.new(post_image_params)

    if @post_image.save
      render json: @post_image, status: :created, location: @post_image
    else
      render json: @post_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post_images/1
  def update
    if @post_image.update(post_image_params)
      render json: @post_image
    else
      render json: @post_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_images/1
  def destroy
    @post_image.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_image
      @post_image = PostImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_image_params
      params.require(:post_image).permit(:post_id, :image, :order_no)
    end
end
