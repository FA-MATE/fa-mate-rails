# frozen_string_literal: true

module Admin
  class TagsController < ApplicationController
    before_action :set_tag, only: %i[show update destroy]

    # GET /tags
    def index
      @tags = Tag.all
    end

    # GET /tags/1
    def show
      render json: @tag
    end

    # POST /tags
    def create
      @tag = Tag.new(tag_params)

      if @tag.save
        show
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tags/1
    def update
      if @tag.update(tag_params)
        render json: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tags/1
    def destroy
      ActiveRecord::Base.transaction do
        @tag.post_tags.delete_all
        @tag.destroy!
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:tag_group_id, :name, :order_no)
    end
  end
end
