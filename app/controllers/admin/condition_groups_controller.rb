# frozen_string_literal: true

module Admin
  class ConditionGroupsController < ApplicationController
    before_action :set_condition_group, only: %i[show update destroy]

    # GET /condition_groups
    def index
      @condition_groups = ConditionGroup.all

      render json: @condition_groups
    end

    # GET /condition_groups/1
    def show
      render json: @condition_group
    end

    # POST /condition_groups
    def create
      @condition_group = ConditionGroup.new(condition_group_params)

      if @condition_group.save
        render json: @condition_group, status: :created, location: @condition_group
      else
        render json: @condition_group.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /condition_groups/1
    def update
      if @condition_group.update(condition_group_params)
        render json: @condition_group
      else
        render json: @condition_group.errors, status: :unprocessable_entity
      end
    end

    # DELETE /condition_groups/1
    def destroy
      @condition_group.destroy!
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_condition_group
      @condition_group = ConditionGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def condition_group_params
      params.require(:condition_group).permit(:name, :order_no)
    end
  end
end
