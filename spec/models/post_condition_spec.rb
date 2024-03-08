require 'rails_helper'

RSpec.describe PostCondition, type: :model do
  describe 'モデル定義の確認' do
    let(:expected_columns) {  ["id", "post_id", "condition_id", "created_at", "updated_at"] }

    it 'モデル定義通りの構成になっている' do
      expect(PostCondition.column_names).to match_array(expected_columns)
    end
  end
end