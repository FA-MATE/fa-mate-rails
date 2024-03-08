# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy like]

  # GET /posts
  def index
    filtered_post_ids = filtered_posts
                        .page(params[:page])
                        .per(params[:per])
                        .map(&:id)
    @posts = Post
             .eager_load(:user, post_images: { image_attachment: :blob }, tags: :tag_group)
             .where(id: filtered_post_ids)
  end

  # GET /posts/1
  def show
    user = User.find(1)
    @already_liked = UserLikePost.exists?(user_id: user.id, post_id: @post.id)
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

  def like
    user = User.find(1)
    user_like_post = UserLikePost.where(user_id: user.id, post_id: @post.id)

    if user_like_post.present?
      user_like_post.destroy
    else
      UserLikePost.create(user_id: user.id, post_id: @post.id)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.eager_load(:user, post_images: { image_attachment: :blob }, tags: :tag_group).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post)
          .permit(:category_id,
                  :sub_category_id,
                  :title,
                  :body,
                  post_conditions_attributes: [:condition_id],
                  post_tags_attributes: [:tag_id],
                  post_images_attributes: %i[image order_no])
  end

  def filtered_posts
    PostFinder.new(category_id: params[:category_id],
                   sub_category_id: params[:sub_category_id],
                   tag_ids: params[:tag_ids]&.split(','),
                   condition_ids: params[:condition_ids]&.split(',')).call
  end
end
