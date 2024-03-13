# frozen_string_literal: true

class UserLikePost
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :post_id, type: Integer

  after_create :notify
  before_destroy :delete_notification

  def notify
    UserNotificationCreator.user_like_post(action_user_id: user_id, post_id:)
  end

  def delete_notification
    UserNotificationRemover.user_like_post(action_user_id: user_id, post_id:)
  end
end
