class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    per = params[:per] || 10
    page = params[:page] || 1
    tag_ids = params[:tag_ids]&.split(",")
    @posts = Post.eager_load(:user, tags: :tag_group)
    @posts = @posts.where(tags: { id: tag_ids }) if tag_ids.present?
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @posts = @posts.where(sub_category_id: params[:sub_category_id]) if params[:sub_category_id].present?

    @posts = @posts.page(page).per(per)
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = 1

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:category_id, :sub_category_id, :title, :body, :tag_ids, :condition_ids)
    end
end
