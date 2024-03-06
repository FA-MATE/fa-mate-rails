class UserNotificationSender
  def initialize(user_notification)
    @user_notification = user_notification
  end

  def call
    sendable_user_devices.each do |device|
      Rails.logger.info "@@@@@@@ FCM token: #{device.device_token}"
    end
  end

  private

  def sendable_user_devices
    UserDevice
      .where(user_id: @user_notification.target_user_id)
      .where(:apk_version.gte => @user_notification.apk_version)
  end
end
