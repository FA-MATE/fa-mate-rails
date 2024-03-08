# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserLikePost do
  describe 'モデル定義の確認' do
    let(:expected_columns) { %w[_id created_at updated_at user_id post_id] }

    it 'モデル定義通りの構成になっている' do
      expect(described_class.fields.keys).to match_array(expected_columns)
    end
  end
end
