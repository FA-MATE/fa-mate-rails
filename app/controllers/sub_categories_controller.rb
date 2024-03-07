class SubCategoriesController < ApplicationController# GET /sub_categories
  # GET /sub_categories
  def index
    @sub_categories = SubCategory.all
  end
end
