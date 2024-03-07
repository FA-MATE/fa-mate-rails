class UsersController < ApplicationController
  # GET /users/me
  def me
    user = User.find(1)
    @user = User.eager_load(:conditions).find(user.id)
  end
end
