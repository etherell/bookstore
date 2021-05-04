# frozen_string_literal: true

RSpec.describe Address do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  # describe '#country_name' do
  #   let(:address) { create(:address) }
  # end
end
