# frozen_string_literal: true

RSpec.describe AuthorBook do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:author) }
  end
end
