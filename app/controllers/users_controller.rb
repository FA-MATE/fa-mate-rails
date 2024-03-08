# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users/me
  def me
    user = User.find(1)
    @user = User.eager_load(:conditions).find(user.id)
  end

  # PUT /users/me/notificaiton_settings
  def notificaiton_settings
    user = User.find(1)
    UserNotificationSetting
      .create_or_update(user_id: user.id,
                        post_notification: params[:post_notification].to_i.positive?,
                        service_message_notification: params[:service_message_notification].to_i.positive?)
  end

  # POST /users/me/devices
  def devices
    user = User.find(1)
    UserDevice.create_or_update(user_id: user.id,
                                device_token: params[:device_token],
                                os_type: params[:os_type],
                                apk_version: params[:apk_version],
                                os_version: params[:os_version])
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
