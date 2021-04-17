# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category).class_name('Category') }
    it { is_expected.to have_and_belong_to_many(:authors).class_name('Author') }
    it { is_expected.to have_and_belong_to_many(:materials).class_name('Material') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
