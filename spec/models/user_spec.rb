require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'モデル定義の確認' do
    let(:expected_columns) { ["id", "nickname", "profile_image_url", "created_at", "updated_at"] }

    it 'モデル定義通りの構成になっている' do
      expect(User.column_names).to match_array(expected_columns)
    end
  end
end
