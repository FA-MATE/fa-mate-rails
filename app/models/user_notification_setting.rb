# frozen_string_literal: true

class UserNotificationSetting
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :post_notification, type: Mongoid::Boolean
  field :service_message_notification, type: Mongoid::Boolean

  class << self
    def create_or_update(user_id:, post_notification:, service_message_notification:)
      notification_setting = UserNotificationSetting.where(user_id:).first
      if notification_setting.present?
        notification_setting.update(post_notification:, service_message_notification:)
      else
        UserNotificationSetting.create(user_id:, post_notification:, service_message_notification:)
      end
    end
  end
end
