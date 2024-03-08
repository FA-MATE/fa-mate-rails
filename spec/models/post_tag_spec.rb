require 'rails_helper'

RSpec.describe PostTag, type: :model do
  describe 'モデル定義の確認' do
    let(:expected_columns) { ["id", "post_id", "tag_id", "created_at", "updated_at"] }

    it 'モデル定義通りの構成になっている' do
      expect(PostTag.column_names).to match_array(expected_columns)
    end
  end
end
