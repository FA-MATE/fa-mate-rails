class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
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
    @user.destroy!
  end

  def me
    user = User.find(1)
    @user = User.eager_load(:conditions).find(user.id)
  end
  
  # PUT /users/me/notificaiton_settings
  def notificaiton_settings
    user = User.find(1)
    notification_setting = UserNotificationSetting.where(user_id: user.id).first
    if notification_setting.present?
      notification_setting
        .update(post_notification: params[:post_notification].to_i.positive?,
                service_message_notification: params[:service_message_notification].to_i.positive?)
    else
      UserNotificationSetting
        .create(user_id: user.id,
                post_notification: params[:post_notification].to_i.positive?,
                service_message_notification: params[:service_message_notification].to_i.positive?)
    end
  end
  
  # POST /users/me/devices
  def devices
    user = User.find(1)
    device = UserDevice.where(user_id: user.id, device_token: params[:device_token]).first
    if device.present?
      device.update(apk_version: params[:apk_version],
                    os_version: params[:os_version])
    else
      UserDevice.create(user_id: user.id,
                        device_token: params[:device_token],
                        os_type: params[:os_type],
                        apk_version: params[:apk_version],
                        os_version: params[:os_version])
    end
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
