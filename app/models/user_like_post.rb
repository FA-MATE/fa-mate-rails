class UserLikePost
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :post_id, type: Integer
end
