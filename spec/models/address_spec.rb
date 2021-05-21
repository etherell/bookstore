# frozen_string_literal: true

RSpec.describe Address do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#country_name' do
    let(:address) { create(:shipping_address, country_code: 'US') }
    let(:expected_result) { 'United States' }

    it 'returns apropriate country name' do
      expect(address.country_name).to eq(expected_result)
    end
  end
end
