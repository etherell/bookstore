# frozen_string_literal: true

RSpec.describe Author do
  describe 'associations' do
    it { is_expected.to have_many(:books) }
    it { is_expected.to have_many(:author_books) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
