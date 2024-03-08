require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'モデル定義の確認' do
    let(:expected_columns) { ["id", "category_id", "sub_category_id", "user_id", "title", "body", "created_at", "updated_at"] }

    it 'モデル定義通りの構成になっている' do
      expect(Post.column_names).to match_array(expected_columns)
    end
  end
end
