# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  describe 'モデル定義の確認' do
    let(:expected_columns) { %w[id tag_group_id name order_no created_at updated_at] }

    it 'モデル定義通りの構成になっている' do
      expect(described_class.column_names).to match_array(expected_columns)
    end
  end
end
