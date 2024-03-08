require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    FactoryBot.create :user, id: 1 rescue nil
  end

  describe "GET /users/me" do
    before do
      # TODO: テスト用の環境を用意する
      allow(UserNotificationSetting).to receive(:where).and_return([])
    end

    it "works! (now write some real specs)" do
      get me_users_path
      expect(response).to have_http_status(200)
    end
  end
end
