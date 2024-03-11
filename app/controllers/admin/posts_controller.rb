# frozen_string_literal: true

module Admin
  class PostsController < ::PostsController
    # GET /admin/posts
    def index
      filtered_post_ids = filtered_posts
                          .page(params[:page])
                          .per(params[:per])
                          .map(&:id)
      @posts = Post
               .eager_load(:user,
                           post_images: { image_attachment: :blob },
                           tags: :tag_group,
                           conditions: :condition_group)
               .where(id: filtered_post_ids)
    end

    private

    def filtered_posts
      PostFinder.new(category_id: params[:category_id],
                     sub_category_id: params[:sub_category_id],
                     tag_ids: params[:tag_ids]&.split(','),
                     condition_ids: params[:condition_ids]&.split(',')).call
    end
  end
end
