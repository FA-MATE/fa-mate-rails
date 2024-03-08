# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppData do
  describe '.new' do
    let(:app_data) { described_class.new }

    it 'app_dataが保持されること' do
      expect(app_data.app_data).to be_present
    end
  end
end
