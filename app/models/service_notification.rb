class ServiceNotification
  include Mongoid::Document
  include Mongoid::Timestamps
  field :payload, type: Hash
  field :apk_version, type: Integer
  field :publised_start_at, type: Time
  field :publised_end_at, type: Time
end
