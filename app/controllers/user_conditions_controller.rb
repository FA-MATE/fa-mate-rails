class UserConditionsController < ApplicationController
  before_action :set_user_condition, only: %i[ show update destroy ]

  # GET /user_conditions
  def index
    @user_conditions = UserCondition.all

    render json: @user_conditions
  end

  # GET /user_conditions/1
  def show
    render json: @user_condition
  end

  # POST /user_conditions
  def create
    @user_condition = UserCondition.new(user_condition_params)

    if @user_condition.save
      render json: @user_condition, status: :created, location: @user_condition
    else
      render json: @user_condition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_conditions/1
  def update
    if @user_condition.update(user_condition_params)
      render json: @user_condition
    else
      render json: @user_condition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_conditions/1
  def destroy
    @user_condition.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_condition
      @user_condition = UserCondition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_condition_params
      params.require(:user_condition).permit(:user_id, :condition_id)
    end
end
