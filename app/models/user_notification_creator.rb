class UserNotificationCreator
  class << self
    def user_like_post(user_id:, post_id:)
      post = Post.find_by(id: post_id)
      return if post.blank?

      notification = UserNotification
                      .where(target_user_id: post.user_id,
                             action_user_id: user_id,
                             kind: ::UserNotification::Kind::USER_LIKE_POST,
                             source_id: post.id).first
      return if notification.present?
    
      payload = {
        title: "notification test",
        body: "notification test #{post.title} ",
        image_url: nil,
        post_id: post.id,
      }

      UserNotification
        .create(target_user_id: post.user_id,
                action_user_id: user_id,
                kind: UserNotification::Kind::USER_LIKE_POST,
                apk_version: UserNotification::ApkVersion::USER_LIKE_POST,
                source_id: post.id,
                payload: payload)
      end
  end
end
