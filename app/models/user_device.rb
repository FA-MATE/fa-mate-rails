# frozen_string_literal: true

class UserDevice
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :device_token, type: String
  field :apk_version, type: String
  field :os_version, type: String
  field :os_type, type: String

  class << self
    def create_or_update(user_id:, device_token:, os_type:, apk_version:, os_version:)
      device = UserDevice.where(user_id:, device_token:).first
      if device.present?
        device.update(apk_version:, os_version:)
      else
        UserDevice.create(user_id:, device_token:, os_type:, apk_version:, os_version:)
      end
    end
  end
end
