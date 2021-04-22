# frozen_string_literal: true

RSpec.describe Book do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:authors) }
    it { is_expected.to have_many(:materials) }
    it { is_expected.to have_many(:author_books) }
    it { is_expected.to have_many(:book_materials) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:authors) }
    it { is_expected.to validate_numericality_of(:publication_year) }
    it { is_expected.to validate_numericality_of(:quantity) }
    it { is_expected.to validate_length_of(:title) }
  end
end
