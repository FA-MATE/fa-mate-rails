module Admin
  class TagGroupsController < ApplicationController
    before_action :set_tag_group, only: %i[ show update destroy ]

    # GET /tag_groups
    def index
      @tag_groups = TagGroup.all

      render json: @tag_groups
    end

    # GET /tag_groups/1
    def show
      render json: @tag_group
    end

    # POST /tag_groups
    def create
      @tag_group = TagGroup.new(tag_group_params)

      if @tag_group.save
        render json: @tag_group, status: :created, location: @tag_group
      else
        render json: @tag_group.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tag_groups/1
    def update
      if @tag_group.update(tag_group_params)
        render json: @tag_group
      else
        render json: @tag_group.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tag_groups/1
    def destroy
      @tag_group.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tag_group
        @tag_group = TagGroup.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def tag_group_params
        params.require(:tag_group).permit(:name, :order_no)
      end
  end
end