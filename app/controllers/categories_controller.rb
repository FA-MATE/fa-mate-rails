class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/:id/sub_categories
  def sub_categories
    @category = Category.eager_load(:sub_categories).find(params[:id])
  end
end
