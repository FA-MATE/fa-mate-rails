class PostConditionsController < ApplicationController
  before_action :set_post_condition, only: %i[ show update destroy ]

  # GET /post_conditions
  def index
    @post_conditions = PostCondition.all

    render json: @post_conditions
  end

  # GET /post_conditions/1
  def show
    render json: @post_condition
  end

  # POST /post_conditions
  def create
    @post_condition = PostCondition.new(post_condition_params)

    if @post_condition.save
      render json: @post_condition, status: :created, location: @post_condition
    else
      render json: @post_condition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post_conditions/1
  def update
    if @post_condition.update(post_condition_params)
      render json: @post_condition
    else
      render json: @post_condition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_conditions/1
  def destroy
    @post_condition.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_condition
      @post_condition = PostCondition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_condition_params
      params.require(:post_condition).permit(:post_id, :condition_id)
    end
end
