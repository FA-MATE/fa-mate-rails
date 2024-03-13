# frozen_string_literal: true

class UserNotificationCreator
  class << self
    def user_like_post(action_user_id:, post_id:)
      post = Post.find_by(id: post_id)
      return if post.blank?

      notification = UserNotification
                     .where(target_user_id: post.user_id,
                            action_user_id:,
                            kind: ::UserNotification::Kind::USER_LIKE_POST,
                            source_id: post.id).first
      return if notification.present?

      create_user_like_post_user_notification(action_user_id, post)
    end

    private

    def user_like_post_payload(post)
      {
        title: 'notification test',
        body: "notification test #{post.title} ",
        image_url: nil,
        post_id: post.id
      }
    end

    def create_user_like_post_user_notification(action_user_id, post)
      UserNotification
        .create(target_user_id: post.user_id,
                action_user_id:,
                kind: UserNotification::Kind::USER_LIKE_POST,
                apk_version: UserNotification::ApkVersion::USER_LIKE_POST,
                source_id: post.id,
                payload: user_like_post_payload(post))
    end
  end
end
