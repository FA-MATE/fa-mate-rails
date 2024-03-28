# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models

  # notice this comes BEFORE the include statement below
  # also notice that :confirmable is not included in this block
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  include AppAuth

  has_many :posts, dependent: :destroy
  has_many :user_conditions, dependent: :destroy
  has_many :conditions, through: :user_conditions

  def notification_settings
    UserNotificationSetting.where(user_id: id).first
  end

  def user_devices
    UserDevice.where(user_id: id)
  end
end
