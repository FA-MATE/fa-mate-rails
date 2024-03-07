class TagsController < ApplicationController
  # GET /tags
  def index
    @tags = Tag.eager_load(:tag_group).all
  end
end
