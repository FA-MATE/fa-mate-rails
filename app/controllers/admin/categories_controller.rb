# frozen_string_literal: true

module Admin
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show update destroy sub_categories]

    # GET /categories
    def index
      @categories = Category.eager_load(:sub_categories).all
      @categories = @categories.where(id: params[:id]) if params[:id]
    end

    def sub_categories; end

    # GET /categories/1
    def show; end

    # POST /categories
    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_category_url(@category, status: :see_other)
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /categories/1
    def update
      if @category.update(category_params)
        redirect_to admin_category_url(@category, status: :see_other)
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    # DELETE /categories/1
    def destroy
      ActiveRecord::Base.transaction do
        @category.posts.destroy_all
        @category.sub_categories.each { |sub_category| sub_category.posts.destroy_all }
        @category.sub_categories.delete_all
        @category.destroy!
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.eager_load(:sub_categories).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :order_no)
    end
  end
end
