require 'rails_helper'

RSpec.describe AppData, type: :model do
  describe '.new' do
    let(:app_data) { AppData.new }

    it 'app_dataが保持されること' do
      expect(app_data.app_data).to be_present
    end
  end
end
