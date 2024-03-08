# frozen_string_literal: true

class UserNotification
  module Kind
    USER_LIKE_POST = 1
  end

  module ApkVersion
    USER_LIKE_POST = 1
  end

  include Mongoid::Document
  include Mongoid::Timestamps
  field :target_user_id, type: Integer
  field :kind, type: Integer
  field :action_user_id, type: Integer
  field :source_id, type: Integer
  field :payload, type: Hash
  field :apk_version, type: Integer

  after_create :send_notification

  def send_notification
    UserNotificationSender.new(self).call
  end
end
