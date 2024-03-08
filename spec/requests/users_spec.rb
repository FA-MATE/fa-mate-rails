# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  before do
    create(:user, id: 1)
  rescue StandardError
    nil
  end

  describe 'GET /users/me' do
    before do
      # TODO: テスト用の環境を用意する
      allow(UserNotificationSetting).to receive(:where).and_return([])
    end

    it 'works! (now write some real specs)' do
      get me_users_path
      expect(response).to have_http_status(:ok)
    end
  end
end
