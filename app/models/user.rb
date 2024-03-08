# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :user_conditions, dependent: :destroy
  has_many :conditions, through: :user_conditions

  def notification_settings
    UserNotificationSetting.where(user_id: id).first
  end

  def devices
    UserDevice.where(user_id: id)
  end
end
