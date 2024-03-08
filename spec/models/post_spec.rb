# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  describe 'モデル定義の確認' do
    let(:expected_columns) do
      %w[id category_id sub_category_id user_id title body created_at updated_at]
    end

    it 'モデル定義通りの構成になっている' do
      expect(described_class.column_names).to match_array(expected_columns)
    end
  end
end
