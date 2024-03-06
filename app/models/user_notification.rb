class UserNotification
  include Mongoid::Document
  include Mongoid::Timestamps
  field :target_user_id, type: Integer
  field :payload, type: Json
  field :apk_version, type: Integer
end
