# frozen_string_literal: true

class UserNotificationRemover
  class << self
    def user_like_post(user_id:, post_id:)
      UserNotification.where(action_user_id: user_id,
                             kind: ::UserNotification::Kind::USER_LIKE_POST,
                             source_id: post_id).destroy
    end
  end
end
