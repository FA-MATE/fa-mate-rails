# frozen_string_literal: true

module Admin
  class UsersController < ::UsersController
    before_action :set_user, only: %i[show update destroy]

    # GET /users
    def index
      @users = User.eager_load(:conditions, posts: :user).all
    end

    # GET /users/1
    def show
      render json: @user
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        show
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      ActiveRecord::Base.transaction do
        @user.posts.destroy_all
        @user.user_conditions.delete_all
        @user.destroy!
      end
    end

    def me
      user = User.find(1)
      @user = User.eager_load(:conditions).find(user.id)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nickname, :profile_image_url)
    end
  end
end
