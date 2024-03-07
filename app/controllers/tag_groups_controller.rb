class TagGroupsController < ApplicationController
  # GET /tag_groups
  def index
    @tag_groups = TagGroup.all
  end
end
