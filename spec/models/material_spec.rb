# frozen_string_literal: true

RSpec.describe Material do
  describe 'associations' do
    it { is_expected.to have_many(:books) }
    it { is_expected.to have_many(:book_materials) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
