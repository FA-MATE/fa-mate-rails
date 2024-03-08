class UserNotificationSetting
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :post_notification, type: Mongoid::Boolean
  field :service_message_notification, type: Mongoid::Boolean
end
