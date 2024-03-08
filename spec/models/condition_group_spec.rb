require 'rails_helper'

RSpec.describe ConditionGroup, type: :model do
  describe 'モデル定義の確認' do
    let(:expected_columns) { ["id", "name", "order_no", "created_at", "updated_at"] }

    it 'モデル定義通りの構成になっている' do
      expect(ConditionGroup.column_names).to match_array(expected_columns)
    end
  end
end
