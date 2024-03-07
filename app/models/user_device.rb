class UserDevice
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :device_token, type: String
  field :apk_version, type: String
  field :os_version, type: String
  field :os_type, type: String
end
