class User < ApplicationRecord
  has_many :posts
  has_many :user_conditions
  has_many :conditions, through: :user_conditions

  def notification_settings
    UserNotificationSetting.where(user_id: self.id).first
  end
end
