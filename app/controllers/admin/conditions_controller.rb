# frozen_string_literal: true

module Admin
  class ConditionsController < ApplicationController
    before_action :set_condition, only: %i[show update destroy]

    # GET /conditions
    def index
      @conditions = Condition.all
    end

    # GET /conditions/1
    def show
      render json: @condition
    end

    # POST /conditions
    def create
      @condition = Condition.new(condition_params)

      if @condition.save
        show
      else
        render json: @condition.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /conditions/1
    def update
      if @condition.update(condition_params)
        render json: @condition
      else
        render json: @condition.errors, status: :unprocessable_entity
      end
    end

    # DELETE /conditions/1
    def destroy
      ActiveRecord::Base.transaction do
        @condition.user_conditions.delete_all
        @condition.post_conditions.delete_all
        @condition.destroy!
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def condition_params
      params.require(:condition).permit(:condition_group_id, :name, :order_no)
    end
  end
end
