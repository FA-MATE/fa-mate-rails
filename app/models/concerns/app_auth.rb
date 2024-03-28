# frozen_string_literal: true

module AppAuth
  extend ActiveSupport::Concern

  class_methods do
    def confirm_by_email_and_token(email, confirmation_token)
      Rails.logger.debug '@@@confirm_by_email_and_token'
      if email.blank?
        confirmable = new
        confirmable.errors.add(:email, :blank)
        return confirmable
      end

      if confirmation_token.blank?
        confirmable = new
        confirmable.errors.add(:confirmation_token, :blank)
        return confirmable
      end

      confirmable = find_first_by_auth_conditions(email:, confirmation_token:)

      unless confirmable
        confirmation_digest = Devise.token_generator.digest(self, :confirmation_token, confirmation_token)
        confirmable = find_or_initialize_with_error_by(:confirmation_token, confirmation_digest)
      end

      confirmable.confirm if confirmable.persisted?
      confirmable
    end
  end

  # override
  def generate_confirmation_token
    Rails.logger.debug '@@@generate_confirmation_token'
    if confirmation_token && !confirmation_period_expired?
      @raw_confirmation_token = confirmation_token
    else
      self.confirmation_token = @raw_confirmation_token = Devise.friendly_token[0..6]
      self.confirmation_sent_at = Time.now.utc
    end
  end
end
