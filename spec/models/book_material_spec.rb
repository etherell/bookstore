# frozen_string_literal: true

RSpec.describe BookMaterial do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:material) }
  end
end
